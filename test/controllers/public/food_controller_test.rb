require "test_helper"

class Public::FoodControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_food_index_url
    assert_response :success
  end
end
