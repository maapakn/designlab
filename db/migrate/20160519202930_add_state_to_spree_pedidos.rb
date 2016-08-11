class AddStateToSpreePedidos < ActiveRecord::Migration
  def change
  	add_column :spree_pedidos, :state, :string, default: "Recepcionado por Laboratorio"
  end
end
