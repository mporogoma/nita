class DailySalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_daily_sale, only: %i[ show edit update destroy ]

  # GET /daily_sales or /daily_sales.json
  # def index
  #   if current_user.admin?
  #     @daily_sales = DailySale.includes(:product).order(date: :desc)
  #   else
  #     @daily_sales = current_user.daily_sales.includes(:product).order(date: :desc)
  #   end
  # end
  def index
    @start_date = params[:start_date] || 7.days.ago.to_date.to_s
    @end_date = params[:end_date] || Date.today.to_s
  
    @daily_sales = DailySale.includes(:product)
                            .where(date: @start_date..@end_date)
                            .order(date: :desc)
  
    if current_user.seller?
      @daily_sales = @daily_sales.where(user: current_user)
    end
  end

  # GET /daily_sales/1 or /daily_sales/1.json
  def show
  end

  # GET /daily_sales/new
  def new
    @daily_sale = DailySale.new
  end

  # GET /daily_sales/1/edit
  def edit
  end

  # POST /daily_sales or /daily_sales.json
  def create
    @daily_sale = DailySale.new(daily_sale_params)
    @daily_sale.user = current_user

    respond_to do |format|
      if @daily_sale.save
        format.html { redirect_to daily_sales_url, notice: "Daily sale was successfully recorded." }
        format.json { render :show, status: :created, location: @daily_sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_sales/1 or /daily_sales/1.json
  def update
    respond_to do |format|
      if @daily_sale.update(daily_sale_params)
        format.html { redirect_to daily_sales_url, notice: "Daily sale was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_sales/1 or /daily_sales/1.json
  def destroy
    @daily_sale.destroy

    respond_to do |format|
      format.html { redirect_to daily_sales_url, notice: "Daily sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_daily_sale
      @daily_sale = DailySale.find(params[:id])
    end

    def daily_sale_params
      params.require(:daily_sale).permit(:date, :product_id, :quantity_sold)
    end
end