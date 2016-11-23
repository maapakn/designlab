module Spree	
	class PedidosController < Spree::StoreController
	  before_action :set_pedido, only: [:show, :update, :destroy, :edit, :update]
	  before_action :authenticate_spree_user!
	  autocomplete :pedido, :id, :full => true

	  def activos
	    @taxonomies = Spree::Taxonomy.includes(root: :children)
	  	palabra = "Despacho"
	  	buscar = params[:search]
	    @pedido = current_spree_user.pedidos.order(created_at: :DESC).where("estado_pago = 2 AND state <> ?",palabra).page(params[:page]).per(3)
	    if buscar != nil && buscar != ""
	      @pedido = current_spree_user.pedidos.id_like(params[:search]).order(created_at: :DESC).where("estado_pago = 2 AND state <> ?",palabra).page(params[:page]).per(3)
	    end
	  end

	  def edit
	  	@pedido = current_spree_user.pedidos.find(params[:id])
	  end

	  def update
		@pedido = current_spree_user.pedidos.update(params[:id], pedido_params)
	  end

	  def reportes
	    @pedido = current_spree_user.pedidos.order(created_at: :DESC).where(estado_pago: 2).page(params[:page]).per(3)
	    @taxonomies = Spree::Taxonomy.includes(root: :children)
	  end

	  # GET /pedidos/1
	  # GET /pedidos/1.json
	  def show
	  	@pedidos = current_spree_user.pedidos.where(estado_pago: 2)
	  	@dientes = Spree::Diente.all
	    @taxonomies = Spree::Taxonomy.includes(root: :children)
	  end

	  def show_activos
	    @pedido = Spree::Pedido.find(params[:id])
	  	@pedidos = current_spree_user.pedidos.where(estado_pago: 2)
	  	@dientes = Spree::Diente.all
	  	@taxonomies = Spree::Taxonomy.includes(root: :children)
	  end

	  # GET /pedidos/new
	  def new
	  	@dientes = Spree::Diente.all
	  	@dentistas = current_spree_user.dentists.all
	    @pedido = current_spree_user.pedidos.new
    	@pedidos = current_spree_user.pedidos.where(estado_pago: 1)
	    @taxonomies = Spree::Taxonomy.includes(root: :children)
	  end

	  def shop
	    @pedidos = current_spree_user.pedidos.where(estado_pago: 1)
	  end

	  def comprar
	  	@pedidos = current_spree_user.pedidos.where(estado_pago: 1).update_all(estado_pago: 2, state: "Pendiente de Pago")
	  	respond_to do |format|
			format.html { redirect_to root_path, notice: 'Su solicitud se ha realizado con exito.' }
		end
	  end

	  def pagar
	  end

	  def express
	    cost = current_spree_user.costo_compra_pendiente
	    response = EXPRESS_GATEWAY.setup_purchase(cost*100,
	      ip: request.remote_ip,
	      return_url: "http://localhost:3000/transactions/checkout",
	      cancel_return_url: "http://localhost:3000/pedidos/new",
	      name: "Chekout de compras en DesingLab",
	      amount: cost*100)
	    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token, review: false)
	  end

	  

	  # POST /pedidos
	  # POST /pedidos.json
	  def create
	    @pedido = current_spree_user.pedidos.new(pedido_params)
	    @pedido.file = params[:file]
	    @pedido.dientes = params[:dientes]
	    @taxonomies = Spree::Taxonomy.includes(root: :children)
	    
	    respond_to do |format|
		    if @pedido.save
		     	if params[:covers]
			        # The magic is here ;)
			        params[:covers].each { |cover|
			            @pedido.pictures.create(cover: cover)
			        }
		        end
		       	format.html { redirect_to new_pedido_path, notice: 'El Pedido se ha creado' }
		    else
		        format.html { render :new }
		        format.json { render json: @pedido.errors, status: :unprocessable_entity }
		    end
	    end
	  end

	  def destroy
	    @pedido.destroy
	    respond_to do |format|
	      format.html { redirect_to new_pedido_path, notice: 'El Pedido se ha eliminado' }
	      format.json { render head :no_content }
	    end
	  end

	  def upload_file(file)
	   	# Declaring
	   		uploader = FileUploader.new
	   	# Upload it
	   		uploader.store!(file)
	    	return uploader.url
  	  end

	  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_pedido
	      @pedido = Spree::Pedido.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def pedido_params
	      params.require(:pedido).permit(:nombres, :apellidos, :observacion, :trabajo_id, :material_id, :pictures, :file, :respuesta, :dentist_id, :diente_ids => [])
	    end
	end
end