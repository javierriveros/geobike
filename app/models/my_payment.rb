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

class MyPayment < ApplicationRecord
  belongs_to :shopping_cart
  has_many :products, through: :shopping_cart

  include AASM

  aasm column: 'status' do
    state :created, initial: true
    state :payed
    state :failed

    event :pay do
      after do
        shopping_cart.pay!
      end
      transitions from: :created, to: :payed
    end
  end

  def products_by_user user
    self.products.where(products: { user_id: user.id })
  end

end
