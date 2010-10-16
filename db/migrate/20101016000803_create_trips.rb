class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.integer :user_id
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :destination
      t.string :destination_city
      t.string :destination_state
      t.string :destination_zip

      t.string :accomodation_name
      t.string :accomodation_address
      t.string :accomodation_city
      t.string :accomodation_state
      t.string :accomodation_zip

      t.string :departure_city
      t.datetime :departure_time
      t.string :arrival_city
      t.datetime :arrival_time

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
