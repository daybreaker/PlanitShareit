class EventsController < ApplicationController
  before_filter :load_trip

  def new
    @event = @trip.events.new
    authorize! :create, @event

    render :action => 'new', :layout => false
  end

  def create
    @event = @trip.events.new(params[:event])
  end

  def index
    @events = @trip.events.unscheduled
    # authorize! :view, @events
    render :layout => false
  end

  def edit
    @event = Event.find(params[:id])

    render :layout => false
  end

  def update
    @event = Event.find(params[:id])
  end  

  private

  def load_trip
    @trip = Trip.find(params[:trip_id])
  end
end
