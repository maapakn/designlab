class RemoveCoverPedido < ActiveRecord::Migration
  def change
  	remove_attachment :spree_pedidos, :cover
  end
end
