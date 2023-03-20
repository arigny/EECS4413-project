require "test_helper"

class PoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @po_item = po_items(:one)
  end

  test "should get index" do
    get po_items_url
    assert_response :success
  end

  test "should get new" do
    get new_po_item_url
    assert_response :success
  end

  test "should create po_item" do
    assert_difference("PoItem.count") do
      post po_items_url, params: { po_item: {  } }
    end

    assert_redirected_to po_item_url(PoItem.last)
  end

  test "should show po_item" do
    get po_item_url(@po_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_po_item_url(@po_item)
    assert_response :success
  end

  test "should update po_item" do
    patch po_item_url(@po_item), params: { po_item: {  } }
    assert_redirected_to po_item_url(@po_item)
  end

  test "should destroy po_item" do
    assert_difference("PoItem.count", -1) do
      delete po_item_url(@po_item)
    end

    assert_redirected_to po_items_url
  end
end
