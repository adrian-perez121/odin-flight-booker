class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: params[:flight_id])
    @num_passengers = params[:num_passengers].to_i
    # These are associated with our booking hence rails knows to load them
    @num_passengers.times {@booking.passengers.build}

  end

end
