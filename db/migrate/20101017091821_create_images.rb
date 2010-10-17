class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.references :album
      t.string :title
      t.text :description
      t.string :name
      t.boolean :cover_image
      t.string :file

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
