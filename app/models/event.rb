# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  details    :text
#  starts_at  :datetime
#  ends_at    :datetime
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  has_one_attached :image
  validates_presence_of :name, :details, :location

  scope :latest, -> { order('id DESC') }
  scope :upcoming, -> { where('starts_at > ?', Date.today) }
  scope :past, -> { where('starts_at < ?', Date.today) }
end
