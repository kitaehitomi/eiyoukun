require "test_helper"

class Admin::FoodControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_food_index_url
    assert_response :success
  end
end
