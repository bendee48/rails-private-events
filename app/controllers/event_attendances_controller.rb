class EventAttendancesController < ApplicationController
  def new
  end

  def create
    @event = Event.find(params[:event_id]).attendees
    @user = User.find(session[:user_id])

    if @event << @user
      flash.notice = "You're attending an event."
      redirect_to :events
    else
      render :events
    end
  end
end
