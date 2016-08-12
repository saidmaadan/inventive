class ProductsController < ApplicationController
  before_action :authenticate_vendor!, except: [:show]
  before_action :set_product, only: [:show, :edit, :update]
  def index
    @products = current_vendor.products
  end

  def new
    @product = current_vendor.products.build
  end

  def show
    @is_buyer = Order.where("product_id = ? AND vendor_id = ?", @product.id, current_vendor.id).present? if current_vendor
    @reviews = @product.reviews
    @reviewed = @reviews.find_by(vendor_id: current_vendor.id) if current_vendor
  end

  def create
    @product = current_vendor.products.build(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def delete
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :delivery_time, :revisions, :requirements, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
