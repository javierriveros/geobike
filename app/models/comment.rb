class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: 1..5
end
