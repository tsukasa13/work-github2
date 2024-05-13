class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @address = current_customer.address
  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping_postal_code = current_customer.postal_code
    @order.shipping_address = current_customer.address
    @order.delivery_name = current_customer.last_name + current_customer.first_name
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
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
