class AddPermissionsToTrip < ActiveRecord::Migration
  def self.up
    add_column :trips, :permissions, :string
  end

  def self.down
    remove_column :trips, :permissions
  end
end
