class Addnombrestospreepedidos < ActiveRecord::Migration
  def up
  	add_column :spree_pedidos, :nombres, :string
  	add_column :spree_pedidos, :apellidos, :string
  end
  def down
  	remove_column :spree_pedidos, :nombres
  	remove_column :spree_pedidos, :apellidos
  end
end
