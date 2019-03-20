require "application_system_test_case"

class BicycleShopsTest < ApplicationSystemTestCase
  setup do
    @bicycle_shop = bicycle_shops(:one)
  end

  test "visiting the index" do
    visit bicycle_shops_url
    assert_selector "h1", text: "Bicycle Shops"
  end

  test "creating a Bicycle shop" do
    visit bicycle_shops_url
    click_on "New Bicycle Shop"

    fill_in "Description", with: @bicycle_shop.description
    fill_in "Lat", with: @bicycle_shop.lat
    fill_in "Lng", with: @bicycle_shop.lng
    fill_in "Name", with: @bicycle_shop.name
    click_on "Create Bicycle shop"

    assert_text "Bicycle shop was successfully created"
    click_on "Back"
  end

  test "updating a Bicycle shop" do
    visit bicycle_shops_url
    click_on "Edit", match: :first

    fill_in "Description", with: @bicycle_shop.description
    fill_in "Lat", with: @bicycle_shop.lat
    fill_in "Lng", with: @bicycle_shop.lng
    fill_in "Name", with: @bicycle_shop.name
    click_on "Update Bicycle shop"

    assert_text "Bicycle shop was successfully updated"
    click_on "Back"
  end

  test "destroying a Bicycle shop" do
    visit bicycle_shops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bicycle shop was successfully destroyed"
  end
end
