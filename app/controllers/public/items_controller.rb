class Public::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page])
    @items_all=Item.all
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new#新しいcart_itemを作成するための記述
  end



end
