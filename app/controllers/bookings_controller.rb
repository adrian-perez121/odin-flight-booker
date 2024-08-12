class BookingsController < ApplicationController
  before_action :require_passengers, only: [:new, :create]

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    @num_passengers = params[:num_passengers].to_i
    # These are associated with our booking hence rails knows to load them
    @num_passengers.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).confirmation_booking.deliver_now
      end
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end

  def require_passengers
    if params[:num_passengers] == '0'
      flash[:notice] = "Please choose a number of Passengers and press save"
      redirect_to root_path
    end
  end


end
