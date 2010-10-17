class Trip < ActiveRecord::Base
  validates_presence_of :destination
  validates_presence_of :start_date
  validates_presence_of :end_date
  
  has_many :events
  belongs_to :user

  default_scope where(:status => 'active')

  before_create :set_title

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
end
