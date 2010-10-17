class DrivingDirectionsController < ApplicationController
	def index
		@trip = Trip.find(params[:trip_id])
		@day = params[:day].blank? ? 1 : params[:day]
		@mapped_events = @trip.events_on_day(@day.to_i,'mapped')
		@unmapped_events = @trip.events_on_day(@day.to_i,'unmapped')
		@starting_location = @trip.starting_location
	end
end
