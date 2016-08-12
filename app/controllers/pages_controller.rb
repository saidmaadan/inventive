class PagesController < ApplicationController
  layout 'home'
  def home
    @product = Product.all
  end
end
