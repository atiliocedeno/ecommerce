class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :parent_id
      t.string :color
      t.string :size
      t.integer :stock
      
      t.timestamps
    end
  end
end
