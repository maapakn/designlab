class CreateSpreeDentists < ActiveRecord::Migration
  def change
    create_table :spree_dentists do |t|
	  t.string :nombre
	  t.references :user

      t.timestamps null: false
    end
    add_index "spree_dentists", ["user_id"], name: "index_spree_dentists_on_user_id", using: :btree
  end
end
