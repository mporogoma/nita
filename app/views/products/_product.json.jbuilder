json.extract! product, :id, :name, :size, :quantity, :purchase_price, :selling_price, :profit, :category_id, :low_stock_threshold, :created_at, :updated_at
json.url product_url(product, format: :json)
