class CreateEventAttendance < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances do |t|
      t.integer :attendee_id, index: true
      t.integer :attended_event_id, index: true

      t.timestamps
    end
  end
end
