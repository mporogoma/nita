class ProductDecorator
  def initialize(product)
    @product = product
  end

  def name_with_stock
    "#{@product.name} (#{@product.quantity} in stock)"
  end

  def method_missing(method, *args, &block)
    @product.send(method, *args, &block)
  end

  def respond_to_missing?(method, include_private = false)
    @product.respond_to?(method, include_private) || super
  end
end