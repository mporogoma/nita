module ProductsHelper
  def stock_status_class(quantity, threshold)
    if quantity <= threshold
      'text-red-600 font-bold'
    else
      'text-gray-500'
    end
  end
end