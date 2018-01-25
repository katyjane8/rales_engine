class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    render json: Merchant.total_items
  end
end
