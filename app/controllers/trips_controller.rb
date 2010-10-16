class TripsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    # TODO Should be users' trips
    @trips = (user_signed_in?) ? Trip.where("user_id = ?", current_user.id) : []
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])

    if @trip.save
      redirect_to @trip, :notice => 'Trip created.'
    else
      render :action => :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update_attributes(params[:trip])
      redirect_to @trip, :notice => 'Trip successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.status = 'deleted'
    @trip.save

    redirect_to(trips_url)
  end
end
