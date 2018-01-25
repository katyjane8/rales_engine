class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    fav_merch = Customer.find_by(customer_params)
    render json: fav_merch.favorite_merchant
  end

  private

    def customer_params
      params.permit(Customer.attribute_names)
    end
end
