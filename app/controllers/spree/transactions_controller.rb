module Spree	
	class TransactionsController < Spree::StoreController
		def checkout
			@transaction = current_spree_user.transactions.new(payerid: strong_params[:PayerID], token: strong_params[:token])
			@transaction.ip_address = request.remote_ip
			@transaction.save
			respond_to  do |format|
				if @transaction.pagar?
					format.html {redirect_to "/", notice: "Su pago ha sido Aceptado"}
				else
					format.html {redirect_to new_pedido_path}
				end
			end
		end

		private
		def strong_params
			params.permit(:token, :PayerID)
		end
	end
end