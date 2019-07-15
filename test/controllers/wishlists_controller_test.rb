require 'test_helper'

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wishlist = wishlists(:one)
  end

  test "should get index" do
    get wishlists_url, as: :json
    assert_response :success
  end

  test "should create wishlist" do
    assert_difference('Wishlist.count') do
      post wishlists_url, params: { wishlist: { restaurant_id: @wishlist.restaurant_id, user_id: @wishlist.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show wishlist" do
    get wishlist_url(@wishlist), as: :json
    assert_response :success
  end

  test "should update wishlist" do
    patch wishlist_url(@wishlist), params: { wishlist: { restaurant_id: @wishlist.restaurant_id, user_id: @wishlist.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy wishlist" do
    assert_difference('Wishlist.count', -1) do
      delete wishlist_url(@wishlist), as: :json
    end

    assert_response 204
  end
end
