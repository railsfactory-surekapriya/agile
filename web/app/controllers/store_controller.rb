class StoreController < ApplicationController
skip_before_action :authorize
include CurrentCart
 before_action :set_cart
  def index
if params[:set_locale]
 redirect_to store_url(locale: params[:set_locale])
 else
  @nations = Nation.order(:country)
  end
end
def store

end
def question

end


end
