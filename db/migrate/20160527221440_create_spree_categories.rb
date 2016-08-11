class CreateSpreeCategories < ActiveRecord::Migration
  def change
    create_table :spree_categories do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
