class Admin::DashboardController < ApplicationController
  def show
    @product_quantity = Product.sum(:quantity)
    @category_types = Category.distinct.count(:name)
  end
end
