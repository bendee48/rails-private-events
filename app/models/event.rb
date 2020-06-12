class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, dependent: :destroy

  def self.past
    where("date < ?", Time.now)
  end

  def self.upcoming
    where("date > ?", Time.now)
  end
end
