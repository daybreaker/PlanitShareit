class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.references :trip

      t.string :title
      t.string :permission, :default => 'private'

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
