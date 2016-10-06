module Spree
	class PedidosDiente < Spree::Base
		belongs_to :pedido
  		belongs_to :diente
	end
end