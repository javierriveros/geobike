require 'test_helper'

class BicycleShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bicycle_shop = bicycle_shops(:one)
  end

  test "should get index" do
    get bicycle_shops_url
    assert_response :success
  end

  test "should get new" do
    get new_bicycle_shop_url
    assert_response :success
  end

  test "should create bicycle_shop" do
    assert_difference('BicycleShop.count') do
      post bicycle_shops_url, params: { bicycle_shop: { description: @bicycle_shop.description, lat: @bicycle_shop.lat, lng: @bicycle_shop.lng, name: @bicycle_shop.name } }
    end

    assert_redirected_to bicycle_shop_url(BicycleShop.last)
  end

  test "should show bicycle_shop" do
    get bicycle_shop_url(@bicycle_shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_bicycle_shop_url(@bicycle_shop)
    assert_response :success
  end

  test "should update bicycle_shop" do
    patch bicycle_shop_url(@bicycle_shop), params: { bicycle_shop: { description: @bicycle_shop.description, lat: @bicycle_shop.lat, lng: @bicycle_shop.lng, name: @bicycle_shop.name } }
    assert_redirected_to bicycle_shop_url(@bicycle_shop)
  end

  test "should destroy bicycle_shop" do
    assert_difference('BicycleShop.count', -1) do
      delete bicycle_shop_url(@bicycle_shop)
    end

    assert_redirected_to bicycle_shops_url
  end
end
