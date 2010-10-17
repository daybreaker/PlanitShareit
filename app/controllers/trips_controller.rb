class TripsController < ApplicationController
  before_filter :authenticate_user!
    require 'geokit'

  def index
    # TODO Should be users' trips
    @trips = user_signed_in? ? current_user.trips : []
  end

  def show
    @trip = Trip.find(params[:id])

	  authorize! :view, @trip
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
	geocode = Geokit::Geocoders::GoogleGeocoder.geocode(@trip.destination)
	@trip.latitude=geocode.lat
	@trip.longitude=geocode.lng
    if @trip.save
      redirect_to @trip, :notice => 'Trip created.'
    else
      render :action => :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
	authorize! :edit, @trip

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
