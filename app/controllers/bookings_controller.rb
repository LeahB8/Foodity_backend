class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all

    render json: @bookings, except: [:created_at, :updated_at]
  end

  # GET /bookings/1
  def show
    render json: @booking, except: [:created_at, :updated_at]
  end

  # POST /bookings
  def create
    @restaurant = Restaurant.find_or_create_by(restaurant_api_id: params[:restaurant_api_id])
    date = params[:date].split('T')[0]
    initialTime = params[:date].split('T')[1].slice(0,5)
    #for british summertime - fix laterrrrr
    minutes = initialTime.split(':')[1]
    hour = initialTime.split(':')[0]

    newHour = hour.to_i + 1
    newHour.to_s + ':' +  minutes
    realTime = newHour.to_s + ':' +  minutes

    @booking = Booking.create(user_id: params[:booking][:user_id], restaurant_id: @restaurant.id, date: date, time: realTime )
      render json: @booking
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:user_id, :restaurant_id, :date, :time)
    end
end
