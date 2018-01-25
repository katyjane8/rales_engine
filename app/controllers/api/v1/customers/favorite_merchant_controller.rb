class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    fav_merch = Customer.find(params[:customer_id])
    render json: fav_merch.favorite_merchant
  end
