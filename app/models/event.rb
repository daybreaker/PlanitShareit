class Event < ActiveRecord::Base
  scope :for_date, lambda {|x| where('DATE(start_date)=?', x)}
end
