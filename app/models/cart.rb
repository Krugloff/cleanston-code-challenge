class Cart < ApplicationRecord
  has_many :cart_items

  validates :discount, numericality: { less_or_equal_than: 1000 }

  def total = cart_items.map(&:total).sum
  def empty? = cart_items.empty?
end