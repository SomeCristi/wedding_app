require 'test_helper'

class WeddingGuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wedding_guest = wedding_guests(:one)
  end

  test "should get index" do
    get wedding_guests_url
    assert_response :success
  end

  test "should get new" do
    get new_wedding_guest_url
    assert_response :success
  end

  test "should create wedding_guest" do
    assert_difference('WeddingGuest.count') do
      post wedding_guests_url, params: { wedding_guest: { name: @wedding_guest.name, table: @wedding_guest.table } }
    end

    assert_redirected_to wedding_guest_url(WeddingGuest.last)
  end

  test "should show wedding_guest" do
    get wedding_guest_url(@wedding_guest)
    assert_response :success
  end

  test "should get edit" do
    get edit_wedding_guest_url(@wedding_guest)
    assert_response :success
  end

  test "should update wedding_guest" do
    patch wedding_guest_url(@wedding_guest), params: { wedding_guest: { name: @wedding_guest.name, table: @wedding_guest.table } }
    assert_redirected_to wedding_guest_url(@wedding_guest)
  end

  test "should destroy wedding_guest" do
    assert_difference('WeddingGuest.count', -1) do
      delete wedding_guest_url(@wedding_guest)
    end

    assert_redirected_to wedding_guests_url
  end
end
