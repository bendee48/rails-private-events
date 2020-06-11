class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy

  has_many :event_attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendances, dependent: :destroy

  def upcoming_events
    split_events.first
  end

  def past_events
    split_events.last
  end

  private 

  def split_events
    attended_events.partition do |event|
      event.date > Time.now
    end
  end
end
