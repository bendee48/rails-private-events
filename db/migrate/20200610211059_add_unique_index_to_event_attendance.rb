class AddUniqueIndexToEventAttendance < ActiveRecord::Migration[6.0]
  def change
    add_index :event_attendances, [:attendee_id, :attended_event_id], unique: true
  end
end
