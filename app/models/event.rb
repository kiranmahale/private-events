class Event < ActiveRecord::Base
	today = Time.now.to_date
  #scope :upcoming, ->{ where("date_of == #{today}")}
  scope :upcoming, ->{ where("date_of >= ?", Time.now.to_date) } 
  scope :past, ->{ where("date_of < ?", Time.now.to_date) }
  
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations
  #validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  validates :date_of, presence: true
end
