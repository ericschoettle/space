class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products
  belongs_to :account
  # validates :status, :total_price, :account_id, :presence => true

  before_save :update_total
  before_save :update_status

  def calculate_total
    self.order_products.collect { |order_product| order_product.product.price * order_product.quantity }.sum
  end

  private

  def update_status
    if self.status == nil
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end
end
