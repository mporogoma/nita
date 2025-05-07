json.extract! daily_sale, :id, :date, :product_id, :quantity_sold, :remaining_quantity, :total_profit, :created_at, :updated_at
json.url daily_sale_url(daily_sale, format: :json)
