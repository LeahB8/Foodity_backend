class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user, include: [:favourites, :bookings, :wishlists, :reviews], except: [:password_digest, :created_at, :updated_at]
    else
      render json: { error: "User not found."}, status: 404
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

    
  def signin
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: { user: user, user_bookings: user.bookings, user_wishlists: user.wishlists, user_favourites: user.favourites, user_reviews: user.reviews, token: issue_token({ id: user.id }) }
    else
      render json: { error: 'Invalid username/password combination.' }, status: 401
    end
  end

  def validate
    user = current_user
    if user
      render json: { user: user, user_bookings: user.bookings, user_wishlists: user.wishlists, user_favourites: user.favourites, user_reviews: user.reviews, token: issue_token({ id: user.id }) }
    else
      render json: { error: 'User not found.' }, status: 404
    end
  end

  def signup
    user = User.new(username: params[:username], password: params[:password])
    if user.valid?
       user.save
      render json: user
    else
      render json: { error: 'Username already taken' }, status: 404
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require[:user]
    end
end