class AddCoverToSpreePedidos < ActiveRecord::Migration
  def change
  	add_attachment :spree_pedidos, :cover
  end
end
