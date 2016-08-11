class Addestadopagotopedidos < ActiveRecord::Migration
  def change
  	add_column :spree_pedidos, :estado_pago, :integer
  end
end
