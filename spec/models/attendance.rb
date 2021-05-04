require 'rails_helper'
RSpec.describe Attendance, type: :model do
  context 'Association Test' do
    it 'checks if attendance has one attendee' do
      should belong_to(:attendee)
    end

    it 'checks if attendance has one attendee' do
      should belong_to(:attended_event)
    end
  end
end
