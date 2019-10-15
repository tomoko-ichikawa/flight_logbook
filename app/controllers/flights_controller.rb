class FlightsController < ApplicationController
  def index
  end

  def new
  	@flight = Flight.new
  end

  def create
  	Flight.create(flight_params)
  	redirect_to new_flight_path
  end

  def index
  	@flights = Flight.all
  end

  def show
  	@flight = Flight.find(params[:id])
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

  private

  def flight_params
  	params.require(:flight).permit(:departure_date, :airline, :flight_number, :aircraft_type, :seat_class, :seat_number, :departure_airport, :departure_estimated_time, :actual_departure_time, :arrival_airport, :arrival_estimated_time, :actual_arrival_time, :flight_time, :flight_mile, :fare, :booking_class, :getting_mile, :getting_point, :review, :photo1, :photo2, :photo3, :total_getting_mile, :total_getting_point)
  end
end
