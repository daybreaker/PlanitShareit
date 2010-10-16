class Trip < ActiveRecord::Base
  validates_presence_of :destination
  validates_presence_of :start_date
  validates_presence_of :end_date

  default_scope where(:status => 'active')
end
