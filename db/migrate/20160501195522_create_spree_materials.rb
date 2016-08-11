class CreateSpreeMaterials < ActiveRecord::Migration
  def change
    create_table :spree_materials do |t|
    	t.string :nombre
      t.timestamps null: false
    end
  end
end
