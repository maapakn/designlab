namespace :delab do
  desc "TODO"
  task diente: :environment do
  	contador = 1
  	@pedidos = Spree::Pedido.where(estado_pago: 2)
  	@pedidos.each do |pedido| 
  		Spree::PedidosDiente.create(pedido_id: pedido.id, diente_id: pedido.diente_id)
  		puts "PedidosDiente #{contador}"
  		contador += 1
  	end
  end
end
