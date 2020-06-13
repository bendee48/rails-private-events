class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, dependent: :destroy

  scope :date_order, -> { order(:date) }
  scope :past, -> { where('date < ?', Time.now).order(date: :desc) }
  scope :upcoming, -> { where('date > ?', Time.now).order(:date) }
end
