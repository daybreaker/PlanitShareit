class DrivingDirectionsController < ApplicationController
	def index
		@trip = Trip.find(params[:trip_id])
		@day = params[:day].blank? ? 1 : params[:day]
	end
end
