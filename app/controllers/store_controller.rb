class StoreController < ApplicationController
  def index
@products= Product.all
@cart = current_cart
  end

def about_us

end


end

