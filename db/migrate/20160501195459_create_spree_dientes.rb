class CreateSpreeDientes < ActiveRecord::Migration
  def change
    create_table :spree_dientes do |t|
    	t.string :numero
    	
      t.timestamps null: false
    end
  end
end
