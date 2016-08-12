class SearchController < ApplicationController
  def index
    @products = Product.all.order("created_at DESC")
  end

  def search
    if params[:q]
      @products = Product.search(params[:q]).order("created_at DESC")
    else
      @products = Product.all.order("created_at DESC")
    end
  end

end
