require "test_helper"

class Public::HandControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_hand_index_url
    assert_response :success
  end
end
