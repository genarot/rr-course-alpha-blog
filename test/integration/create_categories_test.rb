require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get new_category_path

    assert_template 'categories/new'

    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "sports"}}

      follow_redirect!
    end

    # assert_template 'categories/index'
    # p response.body
    assert_template :index
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    get new_category_path

    assert_template 'categories/new'

    assert_no_difference 'Category.count' do
      post categories_path, params: {category:{invalid_param: ""}}
      #
      # follow_redirect!
    end

    # p response
    assert_template 'categories/new'
    assert_select 'div#error-list'
    assert_select 'h4.alert-heading'
    assert_match "The following errors prevented the #{Category.name} from being saved", response.body
    assert_select 'div.alert'
  end
end