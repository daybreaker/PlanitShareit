class EventsController < ApplicationController
  before_filter :load_trip

  def new
    @event = @trip.events.new
    authorize! :create, @event

    respond_to do |format|
      format.html { render :action => 'new', :layout => false }
      format.xml  { render :xml => @event }
    end
  end

  def create
    @event = @trip.events.new(params[:event])
  end

  def index
    @trip = Trip.find(params[:trip_id])
    @events = @trip.events.open
    # authorize! :view, @events
    render :layout => false
  end

  def edit
    @event = Event.find(params[:id])

    render :layout => false
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { render :nothing => true }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors,
                      :status => :unprocessable_entity }
      end
    end
  end  

  private

  def load_trip
    @trip = Trip.find(params[:trip_id])
  end
end
