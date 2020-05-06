require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create({ name: "sports" })
  end

  test "should get categories index" do
    # get categories_path
    get :index
    assert_response :success
  end

  test "should get new" do
    # get new_category_path
    get :new
    assert_response :success
  end

  test "should get show" do
    # get category_path
    get( :show, params: {'id' => @category.id})
    # get( :show, @category)
    assert_response :success
  end
end