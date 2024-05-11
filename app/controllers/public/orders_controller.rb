class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @address = current_customer.address
  end

  def confirm
    @order = Order.new(order_params)
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :delivery_name, :method_of_payment, :payment_amount, :postage)
  end
end
