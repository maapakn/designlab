class Addpricetomaterials < ActiveRecord::Migration
  def change
  	add_column :spree_materials, :price, :integer
  end
end
