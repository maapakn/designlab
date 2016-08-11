class CreateSpreeTransactions < ActiveRecord::Migration
  def change
    create_table :spree_transactions do |t|
      t.string :token
      t.string :payerid
      t.integer :user_id, :null => :false
      t.decimal :total, precision: 10, scale: 3
      t.string :answer

      t.timestamps null: false
    end
    add_index :spree_transactions, :user_id
  end
end
