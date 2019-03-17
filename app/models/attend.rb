class Attend < ApplicationRecord
  belongs_to :event
  belongs_to :user

  
  validates :user_id, presence: true, uniqueness: { scope: [:event] }
  validates :event_id, presence: true, uniqueness: {scope: [:user]}
end
