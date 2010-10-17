class Album < ActiveRecord::Base
  belongs_to :trip

  validates_presence_of :name
end
