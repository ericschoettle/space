module ProductHelper
  def self.sort_by_price
    order('price asc')
  end
end
