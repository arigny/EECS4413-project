require "application_system_test_case"

class VisitEventsTest < ApplicationSystemTestCase
  setup do
    @visit_event = visit_events(:one)
  end

  test "visiting the index" do
    visit visit_events_url
    assert_selector "h1", text: "Visit events"
  end

  test "should create visit event" do
    visit visit_events_url
    click_on "New visit event"

    click_on "Create Visit event"

    assert_text "Visit event was successfully created"
    click_on "Back"
  end

  test "should update Visit event" do
    visit visit_event_url(@visit_event)
    click_on "Edit this visit event", match: :first

    click_on "Update Visit event"

    assert_text "Visit event was successfully updated"
    click_on "Back"
  end

  test "should destroy Visit event" do
    visit visit_event_url(@visit_event)
    click_on "Destroy this visit event", match: :first

    assert_text "Visit event was successfully destroyed"
  end
end
