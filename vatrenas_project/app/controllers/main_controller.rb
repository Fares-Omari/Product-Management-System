class MainController < ApplicationController

  def home
    @products = Product.all #fetch products
  end
  private

end

