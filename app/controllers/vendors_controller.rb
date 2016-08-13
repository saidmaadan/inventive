class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find(params[:id])
    @products = @vendor.products
  end
end
