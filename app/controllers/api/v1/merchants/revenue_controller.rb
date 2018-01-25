class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    merch_rev = Merchant.find_by(rev_params)
    rev = merch_rev.total_revenue.to_s.insert(-3, '.')
    render json: { "revenue" => rev }
  end

  private

    def rev_params
      params.permit(Merchant.attribute_names)
    end
end
