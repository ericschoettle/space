class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  # validates :price, :name, :presence => true
  # def self.search(search)
  #   if search
  #     where('name LIKE ?', "#{search}")
  #   else
  #     scoped
  #   end
  # end
  # def self.order_by_price
  #   Product.order(price: :desc)
  # end
end
