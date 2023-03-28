require "application_system_test_case"

class PoItemsTest < ApplicationSystemTestCase
  setup do
    @po_item = po_items(:one)
  end

  test "visiting the index" do
    visit po_items_url
    assert_selector "h1", text: "Po items"
  end

  test "should create po item" do
    visit po_items_url
    click_on "New po item"

    click_on "Create Po item"

    assert_text "Po item was successfully created"
    click_on "Back"
  end

  test "should update Po item" do
    visit po_item_url(@po_item)
    click_on "Edit this po item", match: :first

    click_on "Update Po item"

    assert_text "Po item was successfully updated"
    click_on "Back"
  end

  test "should destroy Po item" do
    visit po_item_url(@po_item)
    click_on "Destroy this po item", match: :first

    assert_text "Po item was successfully destroyed"
  end
end
