class RemoveDienteIdToPedido < ActiveRecord::Migration
  def change
  	remove_column :spree_pedidos, :diente_id
  end
end
