class AddGeocodeToTrip < ActiveRecord::Migration
  def self.up
    add_column :trips, :latitude, :float
    add_column :trips, :longitude, :float
  end

  def self.down
    remove_column :trips, :longitude
    remove_column :trips, :latitude
  end
end
