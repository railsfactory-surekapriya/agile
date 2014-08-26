class StoreController < ApplicationController
include CurrentCart
 before_action :set_cart
  def index
  @nations = Nation.order(:country)
  end
end
