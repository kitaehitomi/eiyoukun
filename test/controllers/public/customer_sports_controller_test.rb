require "test_helper"

class Public::CustomerSportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_customer_sports_new_url
    assert_response :success
  end
end
