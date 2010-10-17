class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  belongs_to :album

  def next
    Image.where("images.id > ? AND images.album_id=?", self.id, self.album_id).order("images.id ASC").first
  end

  def previous
    Image.where("images.id < ? AND images.album_id=?", self.id, self.album_id).order("images.id DESC").first
  end
end
