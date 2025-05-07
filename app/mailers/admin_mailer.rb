class AdminMailer < ApplicationMailer
  def low_stock_alert(product)
    @product = product
    admins = User.with_role(:admin).pluck(:email)
    mail(to: admins, subject: "Low Stock Alert: #{product.name}")
  end
end