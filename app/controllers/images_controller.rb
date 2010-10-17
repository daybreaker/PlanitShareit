class ImagesController < ApplicationController
  before_filter :load_parents

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
    render :layout => false
  end

  def create
    @image = @album.images.new(params[:image])
#    @image.file = params[:file]
    @image.save!

    redirect_to [@trip, @album]
  end

  private

  def load_parents
    # Trip isn't needed yet
    @trip = Trip.find(params[:trip_id])
    @album = Album.find(params[:album_id])
  end
end
