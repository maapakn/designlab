class CreateSpreePedidos < ActiveRecord::Migration
  def change
    create_table :spree_pedidos do |t|
      t.string :nombre
      t.text :observacion
      t.references :trabajo
      t.references :material
      t.references :user
      t.references :shipping_category

      t.timestamps null: false
    end

    add_index "spree_pedidos", ["trabajo_id"], name: "index_spree_pedidos_on_trabajo_id", using: :btree
    add_index "spree_pedidos", ["material_id"], name: "index_spree_pedidos_on_material_id", using: :btree
    add_index "spree_pedidos", ["user_id"], name: "index_spree_pedidos_on_user_id", using: :btree
    add_index "spree_pedidos", ["shipping_category_id"], name: "index_spree_pedidos_on_shipping_category_id", using: :btree
    
    default_category = Spree::ShippingCategory.first
    default_category ||= Spree::ShippingCategory.create!(:name => "Default")

    Spree::Pedido.where(shipping_category_id: nil).update_all(shipping_category_id: default_category.id)
  end
end
