class Admin::ItemsController < ApplicationController
  def index
    @item=Item.new
    @items=Item.page(params[:page])
  end

  def new
    @item=Item.new

  end

  def show
  end

  def edit
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to admin_items_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
