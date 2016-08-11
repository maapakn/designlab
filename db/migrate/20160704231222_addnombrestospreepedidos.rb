class Addnombrestospreepedidos < ActiveRecord::Migration
  def up
  	remove_column :spree_pedidos, :nombre
  	add_column :spree_pedidos, :nombres, :string
  	add_column :spree_pedidos, :apellidos, :string
  end
  def down
  	add_column :spree_pedidos, :nombre, :string
  	remove_column :spree_pedidos, :nombres
  	remove_column :spree_pedidos, :apellidos
  end
end
