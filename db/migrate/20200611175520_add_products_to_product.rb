class AddProductsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :products, :products, column: :parent_id
  end
end
