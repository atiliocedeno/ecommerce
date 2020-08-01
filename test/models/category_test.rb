require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup 
    @macro1 = categories(:one) #stock :0
    @macro2 = categories(:two) #stock :2
    @subProduct1 = categories(:three) #macro1's son
    @subProduct2 = categories(:four)
    @subSubProduct1 = categories(:five)
    @subSubSubProduct1 = categories(:six)
    @categories = Category.all
  end
  test "Macrocategories" do
    # m = Category.macroCategories
    # m.each do |n|
    #   puts n.name
    # end
    assert_equal(Category.macroCategories.count,2)
  end
  test "subCategories" do
    assert_equal(Category.subCategories.count,4)
  end

  # test "ParentList" do
    # puts @categories.parent_list
  # end

  test "all descendents" do
    @categories.each do |cat|
      puts ("id: #{cat.id} name: #{cat.name} parent_id: #{cat.parent_id}")
    end 
    macro1 = Category.all_descendents(@macro1) #tiene 1 hijo y 1 nieto
    sub1 = Category.all_descendents(@subProduct1) # tiene 1 hijo
    assert_equal(sub1.count,1)
    assert_equal(macro1.count,2)
  end

  test "childrens" do
    macro1 = Category.descendents(@macro1) #tiene un solo hijo
    sub1 = Category.descendents(@macro1) #tiene un solo hijo
    assert_equal(sub1.count,1)
    assert_equal(macro1.count,1)
  end
end
