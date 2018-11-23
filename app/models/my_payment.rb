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
