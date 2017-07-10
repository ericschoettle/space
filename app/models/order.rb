class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products
  belongs_to :account
  # validates :status, :total_price, :account_id, :presence => true
end
