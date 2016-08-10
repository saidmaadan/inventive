class OrdersController < ApplicationController
  before_action :authenticate_vendor!

  def create
    @order = current_vendor.orders.create(order_params)
    redirect_to vendor_orders_path
  end

  def vendor_orders
    @orders = current_vendor.orders
  end

  def user_sales
    @products = current_vendor.services
  end

  private
    def order_params
      params.require(:order).permit(:quantity, :price, :total_price, :product_id)
    end
end
