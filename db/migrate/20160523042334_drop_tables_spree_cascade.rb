class DropTablesSpreeCascade < ActiveRecord::Migration
  def change
  	drop_table :spree_pedidos_dientes, force: :cascade
  	drop_table :spree_payments, force: :cascade
  	drop_table :spree_payment_methods, force: :cascade
  end
end
