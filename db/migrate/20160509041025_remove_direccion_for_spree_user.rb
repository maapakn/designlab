class RemoveDireccionForSpreeUser < ActiveRecord::Migration
  def change
  	remove_column :spree_users, :direccion
  end
end
