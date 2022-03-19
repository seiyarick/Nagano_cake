class Public::AddressesController < ApplicationController
  def index
    @addresses=Address.all
  end

  def edit
  end

  def create
    address=Address.new(address_params)
    address.save
    redirect_to  public_addresses_path(address.id)
  end

  def destroy
    address=Address.find([:id])
    address.destroy
    redirect_to public_addresses_path
  end
  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
