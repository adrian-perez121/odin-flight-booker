# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

codes = ["CA", "NY", "AZ", "AL", "AK", "TX"]
codes.each do |code|
  Airport.create(code: code)
end

yr = Time.now.year
m = Time.now.month + 1
ids = Airport.ids

300.times do
  arr_id = ids.sample
  dept_id = ids.sample
  while dept_id == arr_id
    dept_id = ids.sample
  end

  Flight.create!(arrival_airport_id: arr_id,
                 departure_airport_id: dept_id,
                 flight_duration: rand(1..8),
                 start_time: Time.new(yr, rand(m..12), rand(1..31), rand(1..8) ))

end


