require "test_helper"

class VisitEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visit_event = visit_events(:one)
  end

  test "should get index" do
    get visit_events_url
    assert_response :success
  end

  test "should get new" do
    get new_visit_event_url
    assert_response :success
  end

  test "should create visit_event" do
    assert_difference("VisitEvent.count") do
      post visit_events_url, params: { visit_event: {  } }
    end

    assert_redirected_to visit_event_url(VisitEvent.last)
  end

  test "should show visit_event" do
    get visit_event_url(@visit_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_visit_event_url(@visit_event)
    assert_response :success
  end

  test "should update visit_event" do
    patch visit_event_url(@visit_event), params: { visit_event: {  } }
    assert_redirected_to visit_event_url(@visit_event)
  end

  test "should destroy visit_event" do
    assert_difference("VisitEvent.count", -1) do
      delete visit_event_url(@visit_event)
    end

    assert_redirected_to visit_events_url
  end
end
