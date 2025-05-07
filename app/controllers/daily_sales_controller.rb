class DailySalesController < ApplicationController
  before_action :set_daily_sale, only: %i[ show edit update destroy ]

  # GET /daily_sales or /daily_sales.json
  def index
    @daily_sales = DailySale.all
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

    respond_to do |format|
      if @daily_sale.save
        format.html { redirect_to @daily_sale, notice: "Daily sale was successfully created." }
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
        format.html { redirect_to @daily_sale, notice: "Daily sale was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_sales/1 or /daily_sales/1.json
  def destroy
    @daily_sale.destroy!

    respond_to do |format|
      format.html { redirect_to daily_sales_path, status: :see_other, notice: "Daily sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_sale
      @daily_sale = DailySale.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def daily_sale_params
      params.expect(daily_sale: [ :date, :product_id, :quantity_sold, :remaining_quantity, :total_profit ])
    end
end
