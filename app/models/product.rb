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

class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  has_many :in_shopping_carts
  has_and_belongs_to_many :shopping_carts, through: :in_shopping_carts, foreign_key: 'shopping_cart_id'
  has_many :my_payments, through: :shopping_carts

  validates_presence_of :name, :pricing
  validates :pricing, numericality: { greater_than: 0 }

  # scope :has_category, -> (category) { joins(:category).where("lower(categories.name) LIKE ?", "%#{category.downcase}%") }
  scope :has_category, -> (category) { where(category_id: category) }
  scope :latest, -> { order('created_at DESC') }
  scope :random, -> { find(pluck(:id).sample(4)) }

  def first_image?(image)
    self.images.first == image
  end

  def paypal_form
    {
      name: self.name,
      sku: :item,
      price: (self.pricing / 100),
      currency: "USD",
      quantity: 1
    }
  end

  def sales
    my_payments.payed
  end

  def sales_total
    my_payments.payed.count * self.pricing
  end
end
