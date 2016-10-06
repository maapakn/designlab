class CreateSpreePedidosDientes < ActiveRecord::Migration
  def change
    create_table :spree_pedidos_dientes do |t|
	  t.references :pedido
      t.references :diente
      
      t.timestamps null: false
    end

    add_index "spree_pedidos_dientes", ["pedido_id"], name: "index_spree_pedidos_dientes_on_pedido_id", using: :btree
    add_index "spree_pedidos_dientes", ["diente_id"], name: "index_spree_pedidos_dientes_on_diente_id", using: :btree

  end
end
