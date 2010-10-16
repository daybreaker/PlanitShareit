class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.text :notes
      t.boolean :must_do
      t.boolean :done

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
