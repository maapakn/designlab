class AddDentistToPedido < ActiveRecord::Migration
  def change
  	add_column :spree_pedidos, :dentist_id, :integer
  	add_index :spree_pedidos, :dentist_id
  end
end
