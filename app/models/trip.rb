class Trip < ActiveRecord::Base
  validates_presence_of :destination
  validates_presence_of :start_date
  validates_presence_of :end_date
  
  has_many :events
  belongs_to :user

  default_scope where(:status => 'active')

  before_create :set_title
  before_save :trip_geocode
  before_validation :time_add
  
  def starting_location
	loc = {}
	loc['address'] = self.accomodation_address.blank? ? 
				self.destination_city + ', ' + self.destination_state :
				self.accomodation_address + ' ' + self.accomodation_city + ', ' + self.accomodation_state + ' ' + self.accomodation_zip,
	loc['latlng'] = !self.accomodation_latitude.blank? ?
				self.accomodation_latitude.to_s + ", " + self.accomodation_longitude.to_s :
				self.latitude.to_s + ", " + self.longitude.to_s
	loc['name'] = self.accomodation_address.blank? && self.accomodation_latitude.blank? ?
				self.destination : self.accomodation_name
	loc
  end
  
  def days
    (start_date.to_date..end_date.to_date).to_a
  end
  
  def events_on_day(day, type='all')
	case type
	when 'mapped'
		events = self.events.mapped
	when 'unmapped'
		events = self.events.unmapped
	else
		events = self.events
	end
	
	events.for_date(self.start_date.to_date + (day - 1).days)
  end

  private

  def set_title
    self.title = "#{destination_city} #{start_date.year}"
  end
  
  def trip_geocode
	geocode = Geokit::Geocoders::GoogleGeocoder.geocode(self.destination)
	if geocode.success?
		self.latitude=geocode.lat
		self.longitude=geocode.lng
		self.destination_city = geocode.city
		self.destination_state = geocode.state
		self.destination_zip = geocode.zip
	end
	
	accom_geocode = Geokit::Geocoders::GoogleGeocoder.geocode(self.accomodation_name + ' ' + self.destination_city + ', ' + self.destination_state)
	if accom_geocode.success? and !accom_geocode.street_address.blank?
		self.accomodation_address = accom_geocode.street_address
		self.accomodation_city = accom_geocode.city
		self.accomodation_state = accom_geocode.state
		self.accomodation_zip = accom_geocode.zip
		self.accomodation_latitude=accom_geocode.lat
		self.accomodation_longitude=accom_geocode.lng
	end
	self
  end
  
  def time_add
	self.start_date = self.start_date.to_s + ' 00:00:00'
	self.end_date = self.end_date.to_s  + ' 00:00:00'
	self
  end
  
end
