class CartItem < ApplicationRecord
  belongs_to :cart, required: true
  belongs_to :product, required: true

  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :removed, inclusion: { in: [true, false] }

  delegate :name, to: :product, prefix: true
  delegate :price, to: :product, prefix: true
  delegate :picture, to: :product, prefix: true

  default_scope -> { accountable }

  scope :accountable, -> { where(removed: false) }

  def total = product_price * quantity
  def destroy = self.update(removed: true)
end