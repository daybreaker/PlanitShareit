class AddTimeFieldsToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :event_start, :date
	add_column :events, :start_time, :string
	add_column :events, :end_time, :string
	remove_column :events, :start_date
	remove_column :events, :end_date
  end

  def self.down
    remove_column :events, :event_start
	remove_column :events, :start_time
	remove_column :events, :end_time
	add_column :events, :start_date, :datetime
	add_column :events, :end_date, :datetime
  end
end
