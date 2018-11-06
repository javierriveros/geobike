# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :bigint(8)        not null, primary key
#  shopping_cart_id :bigint(8)
#  product_id       :bigint(8)
#  quantity         :integer          default(1)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class InShoppingCartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
