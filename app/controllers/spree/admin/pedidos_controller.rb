module Spree
	module Admin	
		class PedidosController < Spree::Admin::BaseController	
		  before_action :set_pedido, only: [:show, :update, :destroy, :edit]
		  # GET /pedidos
		  # GET /pedidos.json
		  def index
		  	@q = params[:q]
		  	if @q
		  		@pedidos = Spree::Pedido.joins(:user).joins(:material).joins(:trabajo).where("spree_pedidos.estado_pago = 2 AND spree_pedidos.state ILIKE ? OR spree_pedidos.nombres ILIKE ? OR spree_pedidos.apellidos ILIKE ? OR spree_users.nombre ILIKE ? OR spree_materials.nombre ILIKE ? OR spree_trabajos.nombre ILIKE ?","%#{@q}%","%#{@q}%","%#{@q}%","%#{@q}%","%#{@q}%","%#{@q}%").order(created_at: :DESC).page(params[:page]).per(6)
		  	else 
		    	@pedidos = Spree::Pedido.where(estado_pago: 2).order(created_at: :DESC).page(params[:page]).per(6)
		  	end
		  end

		  # GET /pedidos/1/edit
		  def edit
		  	@pedido = Spree::Pedido.find(params[:id])
		  end

		  def show
		  	@pedidos = Spree::Pedido.where("spree_pedidos.id = ?",params[:id])
	  		@dientes = Spree::Diente.all
		  end

		  # PATCH/PUT /pedidos/1
		  # PATCH/PUT /pedidos/1.json
		  def update
		    respond_to do |format|
		      if @pedido.update(pedido_params)
		        format.html { redirect_to admin_pedidos_path, notice: 'El Pedido se ha actualizado' }
		      else
		        format.html { render :edit }
		      end
		    end
		  end

		  # DELETE /pedidos/1
		  # DELETE /pedidos/1.json
		  def destroy
		    @pedido.destroy
		    respond_to do |format|
		      format.html { redirect_to admin_pedidos_path, notice: 'El Pedido se ha eliminado' }
		      format.json { head :no_content }
		    end
		  end

		  private
		  	def set_pedido
		      @pedido = Spree::Pedido.find(params[:id])
		    end
		    # Never trust parameters from the scary internet, only allow the white list through.
		    def pedido_params
		      params.require(:pedido).permit(:state, :alerta, :image)
		    end
		end
	end
end