module Spree
	module Admin	
		class PedidosController < Spree::Admin::BaseController	
		  before_action :set_pedido, only: [:show, :update, :destroy, :edit]
		  # GET /pedidos
		  # GET /pedidos.json
		  def index
		    @pedido = Spree::Pedido.order(created_at: :DESC).page(params[:page]).per(6)
		  end

		  # GET /pedidos/1/edit
		  def edit
		  	@pedido = Spree::Pedido.find(params[:id])
		  end

		  def show
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