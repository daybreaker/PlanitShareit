class AlbumsController < ApplicationController
  before_filter :load_trip

  def index
    @albums = @trip.albums
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = @trip.albums.new
    authorize! :create, @album

    render :layout => false
  end

  def create
    @album = @trip.albums.new(params[:album])

    if @album.save
      redirect_to [@trip, @album], :notice => 'Album successfully created.'
    else
      redirect_to @trip, :alert => 'Your album could not be saved.'
    end
  end

  def edit
    @album = Album.find(params[:id])

    render :layout => false
  end

  def update
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to(trip_albums_url(@trip))
  end

  private

  def load_trip
    @trip = Trip.find(params[:trip_id])
  end
end
