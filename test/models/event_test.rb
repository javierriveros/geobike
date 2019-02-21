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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
