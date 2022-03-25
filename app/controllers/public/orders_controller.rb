class Public::OrdersController < ApplicationController
  def new
    @order=Order.new

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
    @order_detail = OrderingDetail.new
    @order_detail.price = cart_item.item.price
    @order_detail.amount = cart_item.amount
    @order_detail.order_id = @order.id
    @order_detail.item_id = cart_item.item_id
    @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @total_price = 0
    @cart_items.each do |cart_item|
     @total_price += cart_item.item.add_tax_price*cart_item.amount
    end
    @order.total_payment = @total_price + @order.shipping_cost

  #@shipping_cost = params[:order][:shipping_cost]
    @order.payment_method = params[:order][:payment_method]
    #ご自身住所選択時
      if params[:order][:select_number] == 0.to_s#paramsはカラムを持ってくるため、[]は持ってきたデータを受け取る記述
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.first_name + current_customer.last_name

    #登録済み住所選択時
      elsif params[:order][:select_number] == 1.to_s
        address = current_customer.addresses.find(params[:order][:address_id].to_i)#[:order][:address_id]の文字列を数字に変えるto_iを記述

        @order.postal_code = address.postal_code#上段で持ってきたaddressのidのpostal_codeを右辺に送る。
        @order.address = address.address
        @order.name = address.name

    #新しいお届け先選択時
      elsif params[:order][:select_number] == 2.to_s

        @order.postal_code = params[:order][:postal_code]#フォームで入力したデータをparamsが持ってきて[:order][:postal_code]で郵便番号を呼び出す。
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]

      end


  end

  def index
    @orders = current_customer.orders


  end

  #退会アクション
  def update_delete
    @customer = current_customer
    @customer.update
    redirect_to public_homes_top_path
  end



  def show
    @order = Order.find(params[:id])
    @ordering_details= @order.ordering_details
    @order.shipping_cost = 800
    @total_price = 0
    @ordering_details.each do |ordering_detail|
     @total_price += ordering_detail.item.add_tax_price*ordering_detail.amount
    end
    @order.total_payment = @total_price + @order.shipping_cost




  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :customer_id, :total_payment)
  end
end
