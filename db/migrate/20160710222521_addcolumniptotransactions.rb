class Addcolumniptotransactions < ActiveRecord::Migration
  def change
  	add_column :spree_transactions, :ip_address, :string
  end
end
