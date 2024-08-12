class PassengerMailer < ApplicationMailer
  default from: "bookings@example.com"
  def confirmation_booking
    @passenger = params[:passenger]
    @booking = @passenger.booking
    @passengers = @booking.passengers
    @flight = @booking.flight
    @url = booking_url(@booking)

    mail(to: @passenger.email, subject: "Flight Has Been Booked!")
  end
end
