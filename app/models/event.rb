class Event < ActiveRecord::Base
  belongs_to :trip

  scope :for_date, lambda {|x| where('DATE(start_date)=?', x)}
end
