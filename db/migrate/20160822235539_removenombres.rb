class Removenombres < ActiveRecord::Migration
  def up
  	remove_column :spree_pedidos, :pnombre
  	remove_column :spree_pedidos, :snombre
  	remove_column :spree_pedidos, :papellido
  	remove_column :spree_pedidos, :sapellido
  end
  def down
  	add_column :spree_pedidos, :pnombre
  	add_column :spree_pedidos, :snombre
  	add_column :spree_pedidos, :papellidoe
  	add_column :spree_pedidos, :sapellido
  end
end
