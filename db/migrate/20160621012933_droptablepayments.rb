class Droptablepayments < ActiveRecord::Migration
  def change
  	drop_table :spree_payments
  end
end
