class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # def admin
  #   authorize_admin
  #   @products = Product.all
  #   @categories = Category.all
  #   @daily_sales = DailySale.order(date: :desc).limit(10)
  #   @low_stock_products = Product.low_stock
  #   @total_profit = DailySale.sum(:total_profit)
  #   @total_sales = DailySale.sum(:quantity_sold)
  # end

  def admin
    authorize_admin
    @start_date = params[:start_date] || Date.today.beginning_of_month.to_s
    @end_date = params[:end_date] || Date.today.to_s
  
    @products = Product.all
    @categories = Category.all
    @daily_sales = DailySale.where(date: @start_date..@end_date)
                            .order(date: :desc)
                            .limit(10)
    @low_stock_products = Product.low_stock
    @total_profit = DailySale.where(date: @start_date..@end_date).sum(:total_profit)
    @total_sales = DailySale.where(date: @start_date..@end_date).sum(:quantity_sold)
  end

  def seller
    authorize_seller
    @products = Product.all
    @daily_sales = current_user.daily_sales.order(date: :desc).limit(10)
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

  def authorize_seller
    redirect_to root_path, alert: 'Access denied.' unless current_user.seller?
  end
end