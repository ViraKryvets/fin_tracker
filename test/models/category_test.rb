require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "check the Cat_1 from database" do
    category_one = Category.find_by(name: "Cat_1")
    assert_equal('MyString', category_one.description)
  end
  
  test "return false if name is missed" do
    new_category = Category.new(description: "some text")
    assert_not(new_category.valid?)
  end

  test "return true if category valid" do
    new_category = Category.new(name: "new", description: "some text")
    assert(new_category.valid?)
  end

  test "save and find" do
    new_category = Category.new(name: "new", description: "some text")
    new_category.save()
    new_cat = Category.find_by(name: "new")
    assert_equal("some text", new_cat.description)
  end
end

