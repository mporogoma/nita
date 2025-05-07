class DailySale < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :date, :quantity_sold, :remaining_quantity, :total_profit, presence: true
  validates :quantity_sold, numericality: { greater_than: 0 }
  validates :remaining_quantity, numericality: { greater_than_or_equal_to: 0 }

  before_validation :calculate_totals
  after_create :update_product_quantity

  private

  def calculate_totals
    return unless product

    self.remaining_quantity = product.quantity - quantity_sold
    self.total_profit = quantity_sold * product.profit
  end

  def update_product_quantity
    product.update_quantity!(quantity_sold)
  end
end