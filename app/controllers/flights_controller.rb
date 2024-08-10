class FlightsController < ApplicationController
  def index
    @departing_flights = Airport.joins(:departing_flights).distinct.map { |air_port| [air_port.code, air_port.id]}
    @dates = Flight.distinct.pluck(:start_time).map { |d| [d.strftime("%m/%d/%Y"), d] }
    @arriving_flights = Airport.joins(:arriving_flights).distinct.map { |air_port| [air_port.code, air_port.id]}

    select_flights
  end

  private

  def select_flights
    if params[:departure_airport_id] == '0' && params[:start_time] == '0' && params[:arrival_airport_id] == '0'
      @flights = []
      return
    end
    # Will filter out flights based on search results
    @flights = Flight
    @flights = @flights.departing_from(params[:departure_airport_id].to_i) unless params[:departure_airport_id] == '0'
    @flights = @flights.departing_on(params[:start_time]) unless params[:start_time] == '0'
    @flights = @flights.arriving_at(params[:arrival_airport_id].to_i) unless params[:arrival_airport_id] == '0'

  end
end
