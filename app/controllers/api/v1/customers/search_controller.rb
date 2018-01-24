class Api::V1::Customers::SearchController < ApplicationController

  def index
    render json: Customer.where(search_params)
  end

  def show
    render json: Customer.find_by(search_params)
  end

private

  def search_params
    params.permit(Customer.attribute_names)
  end

end