class Product < ApplicationRecord
  has_many :orders, through: :order_products
  has_many :order_products
  # validates :price, :name, :presence => true
  def self.search(search)
    if search
      where('name LIKE ?', "#{search}")
    else
      scoped
    end
  end
end
