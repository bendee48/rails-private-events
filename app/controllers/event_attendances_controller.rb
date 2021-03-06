class EventAttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @user = User.find(session[:user_id])

    begin 
      @event.attendees << @user
    rescue 
      flash.notice = "Already attending this event."
      redirect_to @event
    else
      flash.notice = "You're attending this event."
      redirect_to @event
    end
  end
end
