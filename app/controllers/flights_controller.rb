class FlightsController < ApplicationController
  def index
    @departing_flights = Airport.joins(:departing_flights).distinct.map { |air_port| [air_port.code, air_port.id]}
    @dates = Flight.distinct.pluck(:start_time).map { |d| [d.strftime("%m/%d/%Y"), d] }
    @arriving_flights = Airport.joins(:arriving_flights).distinct.map { |air_port| [air_port.code, air_port.id]}
  end
end
