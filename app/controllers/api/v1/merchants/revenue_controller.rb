class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    merch_rev = Merchant.find(params[:merchant_id])
    rev = merch_rev.total_revenue.to_s.insert(-3, '.')
    render json: { "revenue" => rev }
  end
end
