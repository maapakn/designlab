class AddDireccionToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :direccion, :string
    add_column :spree_users, :rutf, :string
    add_column :spree_users, :rsocialf, :string
    add_column :spree_users, :girof, :string
    add_column :spree_users, :direccionf, :string
  end
end
