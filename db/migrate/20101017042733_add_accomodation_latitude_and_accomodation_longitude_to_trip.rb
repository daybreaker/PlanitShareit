class AddAccomodationLatitudeAndAccomodationLongitudeToTrip < ActiveRecord::Migration
  def self.up
    add_column :trips, :accomodation_latitude, :float
    add_column :trips, :accomodation_longitude, :float
  end

  def self.down
    remove_column :trips, :accomodation_longitude
    remove_column :trips, :accomodation_latitude
  end
end
