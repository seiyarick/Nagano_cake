class Admin::CustomersController < ApplicationController
  def index
    @customer=Customer.new
    @customers=Customer.all
  end

  def show
  end

  def edit
  end
end
