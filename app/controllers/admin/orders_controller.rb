class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order.shipping_cost = 800
    @orderring_details = @order.ordering_detail
    @total_price = 0
    @@orders.each do |order|
     @total_price += order.price.add_tax_price*order.ordering_detail.amount
    end
  end
end
