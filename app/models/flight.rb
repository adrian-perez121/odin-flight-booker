class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: "Airport"
  belongs_to :departure_airport, class_name: "Airport"

  scope :departing_from, -> (departure_id) { where(departure_airport_id: departure_id) }
  scope :arriving_at, -> (arrival_id) { where(arrival_airport_id: arrival_id)}
  scope :departing_on, -> (date) { where(start_time: date) }
end
