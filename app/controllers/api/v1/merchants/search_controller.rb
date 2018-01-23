class Api::V1::Merchants::SearchController < ApplicationController

  def index
    render json: Merchant.where(search_params)
  end

  def show
    render json: Merchant.find_by(search_params)
  end

private

  def search_params
    params.permit(Merchant.attribute_names)
  end

end
