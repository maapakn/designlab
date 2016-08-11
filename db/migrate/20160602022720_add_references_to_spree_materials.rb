class AddReferencesToSpreeMaterials < ActiveRecord::Migration
  def change
  	add_column :spree_materials, :trabajo_id, :integer
  	add_index :spree_materials, :trabajo_id
  end
end
