class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :update, :destroy]

  # GET /favourites
  def index
    @favourites = Favourite.all
    render json: @favourites, except: [:created_at, :updated_at]
  end

  # GET /favourites/1
  def show
    render json: @favourite, except: [:created_at, :updated_at]
  end

  # POST /favourites
  def create
    @restaurant = Restaurant.find_or_create_by(restaurant_api_id: params[:restaurant_api_id])
    @favourite = Favourite.create(user_id: params[:favourite][:user_id], restaurant_id: @restaurant.id)
      render json: @favourite
  end

  # DELETE /favourites/1
  def destroy
    @favourite.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

end
