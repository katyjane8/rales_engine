class Api::V1::Transactions::SearchController < ApplicationController

  def index
    render json: Transaction.where(search_params)
  end

  def show
    render json: Transaction.find_by(search_params)
  end

private

  def search_params
    params.permit(Transaction.attribute_names)
  end

end
