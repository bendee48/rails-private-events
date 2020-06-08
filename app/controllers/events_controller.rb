class EventsController < ApplicationController
  def index
    @events = Event.includes(:creator).all
  end

  def new
    @event = Event.new
  end

  def create
    @event = User.find(session[:user_id]).created_events.build(event_params)

    if @event.save
      flash.notice = "Event successfully created."
      redirect_to @event
    else
      flash.now = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :date, :location)
  end
end
