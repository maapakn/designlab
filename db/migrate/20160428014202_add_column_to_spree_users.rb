class AddColumnToSpreeUsers < ActiveRecord::Migration
  def change
  	add_column :spree_users, :nombre, :string
  	add_column :spree_users, :rut, :string
  	add_column :spree_users, :direccion, :string
  	add_column :spree_users, :telefono, :string
  	add_column :spree_users, :institucion, :string
  	add_column :spree_users, :facturacion, :string
  	add_column :spree_users, :roles_mask, :string
  end
end
