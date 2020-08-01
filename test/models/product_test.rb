require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup 
    @product1 = products(:one) #stock :0
    @product2 = products(:two) #stock :2
    @product3 = products(:three) #stock :1
    @product4 = products(:four) #stock :3
    @product = Product.all
  end
  test "product with stock" do
    puts "product with stock"
    assert_equal(@product.with_stock.count,3)
  end

  test "product available" do
    puts "available product"
    catalog = Product.available_product
    catalog.each do |c|
      puts ("id: #{c.id} name: #{c.name} stock: #{c.stock} parent_id: #{c.parent_id}")
    end
    assert_equal(@product.available_product.count,3)
  end

  test "one variant per product" do
    puts "one_variant_per_product"
    filtered_catalog = []
    catalog = Product.one_product_per_variant
    catalog.each do |c|
      puts c.name
    end
    assert_equal(catalog.count,3)
  end
end
