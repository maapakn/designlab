class AddDataModalsToPedido < ActiveRecord::Migration
  def change
  	add_column :spree_pedidos, :alerta, :string
  	add_column :spree_pedidos, :respuesta, :string
  	add_attachment :spree_pedidos, :image
  end
end
