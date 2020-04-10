require "application_system_test_case"

class WeddingGuestsTest < ApplicationSystemTestCase
  setup do
    @wedding_guest = wedding_guests(:one)
  end

  test "visiting the index" do
    visit wedding_guests_url
    assert_selector "h1", text: "Wedding Guests"
  end

  test "creating a Wedding guest" do
    visit wedding_guests_url
    click_on "New Wedding Guest"

    fill_in "Name", with: @wedding_guest.name
    fill_in "Table", with: @wedding_guest.table
    click_on "Create Wedding guest"

    assert_text "Wedding guest was successfully created"
    click_on "Back"
  end

  test "updating a Wedding guest" do
    visit wedding_guests_url
    click_on "Edit", match: :first

    fill_in "Name", with: @wedding_guest.name
    fill_in "Table", with: @wedding_guest.table
    click_on "Update Wedding guest"

    assert_text "Wedding guest was successfully updated"
    click_on "Back"
  end

  test "destroying a Wedding guest" do
    visit wedding_guests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wedding guest was successfully destroyed"
  end
end
