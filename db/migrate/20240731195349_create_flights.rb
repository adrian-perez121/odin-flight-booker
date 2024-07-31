class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.integer :arrival_airport_id
      t.integer :departure_airport_id
      t.datetime :start_time
      t.integer :flight_duration

      t.timestamps
    end
  end
end
