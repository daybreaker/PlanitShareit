class Event < ActiveRecord::Base
  belongs_to :trip

  scope :for_date, lambda {|x| where('DATE(start_date)=?', x)}
  scope :unscheduled, where(:start_date => nil)
  scope :mapped, where('latitude IS NOT NULL')
  scope :unmapped, where('latitude IS NULL')

  before_save :event_geocode
  
  validates_presence_of :title
  
  def event_geocode
		geocode = Geokit::Geocoders::GoogleGeocoder.geocode(self.location + ', ' + self.trip.destination_city + ', ' + self.trip.destination_state)
		if geocode.success? and !geocode.street_address.blank?
			self.latitude = geocode.lat
			self.longitude = geocode.lng
			self.location = geocode.full_address
		end
		self
  end
end
