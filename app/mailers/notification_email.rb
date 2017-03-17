class NotificationEmail < ApplicationMailer

  def order_email(order,line_items )
    #@user = user
    @order = order
    @line_items = line_items
    @url = 'http://localhost:3000/orders/:id'
    mail(to: @order.email, subject: 'Your order with Jungle')
  end
end
