require "test_helper"

class Public::CustomerFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_customer_foods_new_url
    assert_response :success
  end
end
