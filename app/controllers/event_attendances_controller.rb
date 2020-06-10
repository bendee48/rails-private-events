class EventAttendancesController < ApplicationController
  def new
  end

  def create
    @event_attendance = Event.find(params[:event_id]).attendees
    @user = User.find(session[:user_id])

    if @event_attendance << @user
      flash.notice = "You're attending an event."
      redirect_to :events
    else
      flash.notice = "There was an error. Please try again."
      redirect_to :events
    end
  end
end
