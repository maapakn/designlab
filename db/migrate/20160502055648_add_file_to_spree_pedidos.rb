class AddFileToSpreePedidos < ActiveRecord::Migration
  def change
    add_column :spree_pedidos, :file, :string
  end
end
