# == Schema Information
#
# Table name: my_payments
#
#  id               :bigint(8)        not null, primary key
#  email            :string
#  ip               :string
#  status           :string
#  fee              :decimal(6, 2)
#  paypal_id        :string
#  total            :decimal(8, 2)
#  shopping_cart_id :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class MyPaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
