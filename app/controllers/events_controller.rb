class EventsController < ApplicationController
  
  def new
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end
  
  def create
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.create(params[:event])
    
    redirect_to trip_path(@trip)
  end
  
  def index
    @trip = Trip.find(params[:trip_id])
    @events = @trip.events
  end
  
  # def show
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @event }
  #   end
  # end
  
  def edit
    @trip = Trip.find(params[:trip_id])
    @event = Event.find(params[:id])
  end
  
  def update
    @trip = Trip.find(params[:trip_id])
    @event = Event.find(params[:id])
    

      respond_to do |format|
        if @event.update_attributes(params[:event])
          format.html { redirect_to( @trip,
                        :notice => 'Post was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @event.errors,
                        :status => :unprocessable_entity }
        end
      end
  end
  
end
