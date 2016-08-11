module Spree
	class SearchController < Spree::StoreController
	  autocomplete :pedido, :nombres, :full => true	

	  def create
	  	palabra = "%#{params[:search]}%"
	  	fechai = params[:desde]
	  	fechaf = params[:hasta]

	  	if palabra != '%%'
	  		@pedido = current_spree_user.pedidos.where("estado_pago = 2 AND nombres ILIKE ? OR apellidos ILIKE ?",palabra, palabra).page(params[:page]).per(3)
	  	end
	  	if fechai != nil && fechaf != nil
	  		@pedido = current_spree_user.pedidos.where("estado_pago = 2 AND created_at BETWEEN ? AND ?",fechai,fechaf).page(params[:page]).per(3)
	  	end
	  	respond_to do |format|
	  		format.html { redirect_to reportes_path } 
	  		format.json { render json: @pedido }
	  		format.js
	  	end

	  end
	end
end