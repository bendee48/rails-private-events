class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy

  has_many :event_attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendances, dependent: :destroy

  def past_events
    attended_events.where('date < ?', Time.now)
  end

  def upcoming_events
    attended_events.where('date > ?', Time.now)
  end
end
