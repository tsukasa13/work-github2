class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
