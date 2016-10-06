class CreateSpreePictures < ActiveRecord::Migration
  def change
    create_table :spree_pictures do |t|
      t.attachment :cover
      t.references :pedido

      t.timestamps null: false
    end
    add_index "spree_pictures", ["pedido_id"], name: "index_spree_pictures_on_pedido_id", using: :btree
  end
end
