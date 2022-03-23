class Public::OrdersController < ApplicationController
  def new
    @order=Order.new

  end

  def create


  end

  def confirm
    @order=Order.new

    #ご自身住所選択時
      if params[:order][:select_number] == "1"#paramsはカラムを持ってくるため、[]は持ってきたデータを受け取る記述

       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.first_name + current_customer.last_name
          
    #登録済み住所選択時
      elsif params[:order] [:select_number] == "2"
        address = Address.find(params[:order][:address_id].to_i)#[:order][:address_id]の文字列を数字に変えるto_iを記述

        @order.postal_code = address.postal_code#上段で持ってきたaddressのidのpostal_codeを右辺に送る。
        @order.address = address.address
        @order.name = address.name

    #新しいお届け先選択時
      elsif params[:order][:select_number] == "3"

        @order.postal_code = params[:order][:postal_code]#フォームで入力したデータをparamsが持ってきて[:order][:postal_code]で郵便番号を呼び出す。
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
        
        
      end


  end

  def index
  end



  def show
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
