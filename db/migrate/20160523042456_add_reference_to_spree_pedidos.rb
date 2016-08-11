class AddReferenceToSpreePedidos < ActiveRecord::Migration
  def change
  	add_column :spree_pedidos, :diente_id, :integer
  	add_index :spree_pedidos, :diente_id
  end
end
