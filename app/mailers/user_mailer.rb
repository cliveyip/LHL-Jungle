class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  def order_receipt_email(order)
    @order = order
    mail(to: 'yipsifu@gmail.com', subject: "Order Receipt")
  end
end
