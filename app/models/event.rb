class Event < ActiveRecord::Base
  belongs_to :trip

  scope :for_date, lambda {|x| where('EVENT_START=?', x)}
  scope :unscheduled, where(:event_start => nil)
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
  
  def self.build_time
	time = []
	time << ['- Select a Time -','']
	(0..23).each do |hour|
		meridian = (hour < 12) ? 'AM' : 'PM'
		hour_str = (hour < 10) ? '0' + hour.to_s : hour.to_s
		disp_hour = (hour == 0 || hour == 12) ? '12' : (hour % 12).to_s
		['00','15','30','45'].each do |minutes|
			time << [disp_hour + ":" + minutes + " " + meridian, hour_str + ":" + minutes] unless (hour == 0 || hour == 12) && minutes == '00'
		end
	end
	time << ['Midnight', '00:00']
	time << ['Noon', '12:00']
	time.sort! do |a, b|
		a[1] <=> b[1]
	end
	time
  end
end
