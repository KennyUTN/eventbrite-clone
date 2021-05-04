module EventsHelper
  def event_attend_helper
    unless user_signed_in? && @attendees.where(id: current_user.id).exists?
      link_to 'Join event', attend_event_path, method: :post,
                                               class: 'button is-primary has-text-white'
    end
  end

  def event_unattend_helper
    if user_signed_in? && @attendees.where(id: current_user.id).exists?
      link_to 'Cancel Attendance', unattend_event_path, method: :delete,
                                                        class: 'button is-danger has-text-white'
    end
  end

  def delete(event)
    return unless user_signed_in? && current_user.id == event.user_id

    link_to 'Delete Event', event,
            method: :delete,
            class: 'button is-danger has-text-white mx-1'
  end
end
