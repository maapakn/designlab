class CreateSpreeTrabajos < ActiveRecord::Migration
  def change
    create_table :spree_trabajos do |t|
    	t.string :nombre
    	
      t.timestamps null: false
    end
  end
end
