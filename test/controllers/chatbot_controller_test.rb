require "test_helper"

class ChatbotControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get chatbot_show_url
    assert_response :success
  end
end
