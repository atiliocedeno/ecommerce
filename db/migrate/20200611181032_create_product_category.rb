class CreateProductCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
      t.references :products, foreign_key: true
      t.references :categories, foreign_key: true
    end
  end
end
