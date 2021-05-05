class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @attended_event = @event.attendances.create(attendee: current_user)
    # current_user.attended_events << @event
    if @attended_event.save
      redirect_to root_path, notice: 'You are now attending the event!'
    else
      redirect_to root_path, alert: 'Something went Wrong!'
    end
  end

  def destroy
    @attend = Attendance.find_by(event_id: params[:id])
    redirect_to root_path, notice: 'Event removed from attending list' if @attend.destroy
  end
end
