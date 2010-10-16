class EventsController < ApplicationController
  
  def new
    @trip = Trip.find(params[:trip_id])
    logger.info @trip
    @event = @trip.events.new
	authorize! :create, @event

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end
  
  def create
    @trip = Trip.find(params[:trip_id])
    
    logger.info @trip
    
    @event = @trip.events.create(params[:event])
    redirect_to trip_path(@trip)
  end
  
  def index
    @trip = Trip.find(params[:trip_id])
	@events = @trip.events
   	authorize! :view, @events
 
  end
  
  def show
	@event = Event.find(params[:id])
   	authorize! :view, @event

  end
  
end
