class AddPermissionsToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :permissions, :string
  end

  def self.down
    remove_column :events, :permissions
  end
end
