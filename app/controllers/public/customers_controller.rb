class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def create
    customer=Customer.find(params[:id])
    customer.save(customer_params)
    redirect_to public_customer_path(customer.id)
  end

  def update
    customer=Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_homes_top_path
  end

  def update_delete
    customer=current_customer
    customer.update(is_deleted: true)#updateと同時にis_deleted: true として退会状態にする　＊is_deleted ・・・退会していますか
    reset_session#セッション情報を全て削除
    redirect_to public_homes_top_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
