# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

default_products = [
  {
    name: "Беспроводная колонка Goodyear Bluetooth Speaker",
    price: 1600,
    quantity: 1,
    filename: "speaker.jpg"
  },
  {
    name: "Женский домашний костюм Sweet Dreams",
    price: 800,
    quantity: 1,
    filename: "costume.jpg"
  },
  {
    name: "Плащ-дождевик SwissOak",
    price: 400,
    quantity: 2,
    filename: "cloak.jpg"
  }
]

default_products.each do |default_product|
  record = Product.find_or_create_by!(default_product.slice(:name, :price))

  unless record.picture.attached?
    filename = default_product[:filename]
    io = File.open(Rails.root.join("db/seeds/#{filename}"))
    record.picture.attach(io:, filename:)
  end
end
