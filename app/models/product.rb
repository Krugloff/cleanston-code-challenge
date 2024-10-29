class Product < ApplicationRecord
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  # TODO: uniqality?
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end