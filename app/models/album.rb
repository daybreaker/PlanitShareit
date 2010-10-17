class Album < ActiveRecord::Base
  belongs_to :trip
  has_many :images

  validates_presence_of :title
end
