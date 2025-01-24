class Product < ApplicationRecord
  has_one_attached :image
  validates :price, numericality: { greater_than: 0, notice: "must be a positive number" }
  validates :quantity, numericality: { only_integer: true, greater_than: 0, notice: "must be a positive integer" }
  validates :name, presence: { message: "Name can't be blank" }
  validates :price, presence: { message: "Price can't be blank" }
  validates :currency, presence: { message: "Currency can't be blank" }

end
