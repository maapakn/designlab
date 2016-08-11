class AddReferencesToSpreeTrabajos < ActiveRecord::Migration
  def change
  	add_column :spree_trabajos, :category_id, :integer
  	add_index :spree_trabajos, :category_id
  end
end
