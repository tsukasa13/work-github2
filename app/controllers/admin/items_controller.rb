class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end
end
