class Event < ActiveRecord::Base
  belongs_to :trip

  scope :for_date, lambda {|x| where('DATE(start_date)=?', x)}
  scope :unscheduled, where(:start_date => nil)
  scope :mapped, where('latitude IS NOT NULL')
  scope :unmapped, where('latitude IS NULL')
end
