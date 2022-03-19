class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def create
    customer=Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
