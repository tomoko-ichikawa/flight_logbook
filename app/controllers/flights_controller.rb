class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index]

  def index
    @flights = Flight.all
  end

  def new
    if params[:back]
  	 @flight = Flight.new(flight_params)
    else
      @flight = Flight.new
    end
  end

  def create
  	@flight = Flight.create(flight_params)
    @flight.user_id = current_user.id
    if @flight.save
      redirect_to new_flight_path
    else
      render 'new'
    end
  end

  def index
  	@flights = Flight.all
  end

  def show
  	@flight = Flight.find(params[:id])
    @user = @flight.user
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      redirect_to flights_path,notice: "フライトログを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @flight.destroy
    redirect_to flights_path, notice:"ログを削除しました"
  end

  def confirm
    @flight = Flight.new(flight_params)
  end

  private

  def flight_params
  	params.require(:flight).permit(:departure_date, :airline, :flight_number, :aircraft_type, :seat_class, :seat_number, :departure_airport, :departure_estimated_time, :actual_departure_time, :arrival_airport, :arrival_estimated_time, :actual_arrival_time, :flight_time, :flight_mile, :fare, :booking_class, :getting_mile, :getting_point, :review, :photo1, :photo2, :photo3, :total_getting_mile, :total_getting_point)
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end
end
