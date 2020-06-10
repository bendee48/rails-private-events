class AddForeignKeysToEventAttendance < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :event_attendances, :users, column: :attendee_id
    add_foreign_key :event_attendances, :events, column: :attended_event_id
  end
end
