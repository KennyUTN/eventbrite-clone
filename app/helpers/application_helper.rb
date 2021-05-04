module ApplicationHelper
  def new_event_helper
    link_to 'New Event', new_event_path, class: 'control button is-info' if user_signed_in?
  end

  def logout_helper
    link_to 'Logout', destroy_user_session_path, method: :delete, class: 'control button is-info' if user_signed_in?
  end

  def sign_in
    link_to 'Sign In', new_user_session_path, class: 'control button is-info' unless user_signed_in?
  end

  def sign_up
    link_to 'Sign Up', new_user_registration_path, class: 'control button is-info' unless user_signed_in?
  end
  def user_events_helper
    link_to 'My Events', user_path(current_user.id), class: 'control button is-info' if user_signed_in?
  end
end
