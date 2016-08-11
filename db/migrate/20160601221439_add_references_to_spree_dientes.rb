class AddReferencesToSpreeDientes < ActiveRecord::Migration
  def change
  	add_column :spree_dientes, :zona_id, :integer
  	add_index :spree_dientes, :zona_id
  end
end
