class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
		@uninvited = User.all - @event.attendees
		
	end

	def all
		@Uevents = current_user.created_events.upcoming
		@Pevents = current_user.created_events.past
	end

	def create
		#@event = current_user.events.create(event_params)
		@event = current_user.created_events.create(event_params)
		if @event.save
			redirect_to root_url
		else
			render 'new'
		end
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :date_of)
	end
end
