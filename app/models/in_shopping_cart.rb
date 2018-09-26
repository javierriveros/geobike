# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :bigint(8)        not null, primary key
#  shopping_cart_id :bigint(8)
#  product_id       :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class InShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
end
