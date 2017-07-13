module ApplicationHelper
  # def sortable()
  #   css_class = column == sort_column ? "current #{sort_direction}" : nil
  #   direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  #   link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  # end

  def products_by_price
    Product.order_by_price('price ASC').paginate(page: params[:page], per_page: 10)
  end
end
