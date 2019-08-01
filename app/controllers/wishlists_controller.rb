class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :update, :destroy]

  # GET /wishlists
  def index
    @wishlists = Wishlist.all

    render json: @wishlists, except: [:created_at, :updated_at]
  end

  # GET /wishlists/1
  def show
    render json: @wishlist, except: [:created_at, :updated_at]
  end

  # POST /wishlists
  def create
    @restaurant = Restaurant.find_or_create_by(restaurant_api_id: params[:restaurant_api_id])
    @wishlist = Wishlist.create(user_id: params[:wishlist][:user_id], restaurant_id: @restaurant.id)
    render json: @restaurant
  end

  # PATCH/PUT /wishlists/1
  def update
    if @wishlist.update(wishlist_params)
      render json: @wishlist
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wishlists/1
  def destroy
    @wishlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id, :restaurant_id)
    end
end
