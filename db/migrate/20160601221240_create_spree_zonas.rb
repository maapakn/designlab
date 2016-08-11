class CreateSpreeZonas < ActiveRecord::Migration
  def change
    create_table :spree_zonas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
