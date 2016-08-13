class PagesController < ApplicationController
  layout 'home'
  
  def home
    @products = Product.all
  end
end
