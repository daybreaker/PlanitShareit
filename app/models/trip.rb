class Trip < ActiveRecord::Base
  validates_presence_of :destination
  validates_presence_of :start_date
  validates_presence_of :end_date

  default_scope where(:status => 'active')

  before_create :set_title

  def days
    (start_date.to_date..end_date.to_date).to_a
  end

  private

  def set_title
    self.title = "#{destination_city} #{start_date.year}"
  end
end
