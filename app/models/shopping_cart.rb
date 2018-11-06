# == Schema Information
#
# Table name: shopping_carts
#
#  id         :bigint(8)        not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
  has_many :in_shopping_carts
  has_many :products, through: :in_shopping_carts

  def total
    products.sum("pricing * quantity")
  end
end
