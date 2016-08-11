class RemoveDefaultPedidoState < ActiveRecord::Migration
  def change
  	remove_column :spree_pedidos, :state
  	add_column :spree_pedidos, :state, :string
  end
end
