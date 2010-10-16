class EventsController < ApplicationController
  
  def new
    @trip = Trip.find(params[:trip_id])
    logger.info @trip
    @event = @trip.events.new

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
    
  end
  
  def show
    
  end
  
end
