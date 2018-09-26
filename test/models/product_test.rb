# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  pricing     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint(8)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
