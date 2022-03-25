class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @ordering_details=@order.ordering_details
   
    @order.shipping_cost = 800
    @total_price = 0
    @ordering_details.each do |ordering_detail|
     @total_price += ordering_detail.item.add_tax_price*ordering_detail.amount
    end
    @order.total_payment = @total_price + @order.shipping_cost


  end

  def update

  end
end


private
def order_params
  params.require(:order).permit()
end
