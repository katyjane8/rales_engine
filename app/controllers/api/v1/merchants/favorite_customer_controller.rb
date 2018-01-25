class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    render json: Customer.favorite_for_merchant(params[:merchant_id])
  end
end
