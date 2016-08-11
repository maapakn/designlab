class AddPrecioToMaterial < ActiveRecord::Migration
  def change
  	add_column :spree_materials, :precio, :integer
  end
end
