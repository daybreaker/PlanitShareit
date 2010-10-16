class EventsController < ApplicationController
  
  def new
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.new
    authorize! :create, @event

    respond_to do |format|
      format.html { render :action => 'new', :layout => false }
      format.xml  { render :xml => @event }
    end
  end
  
  def create
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.create(params[:event])
    
    render :nothing => true
  end
  
  def index
    @trip = Trip.find(params[:trip_id])
    @events = @trip.events.open
    # authorize! :view, @events
    render :layout => false
  end
  
  # def show
  #     @event = Event.find(params[:id])
  #     # authorize! :view, @event
  #     respond_to do |format|
  #       format.html # show.html.erb
  #       format.xml  { render :xml => @event }
  #     end
  #   end
  
  def edit
    @trip = Trip.find(params[:trip_id])
    @event = Event.find(params[:id])
    
    render :layout => false
  end
  
  def update
    @trip = Trip.find(params[:trip_id])
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
end
