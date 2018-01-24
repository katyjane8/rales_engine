class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: Item.where(search_params)
  end

  def show
    render json: Item.find_by(search_params)
  end

private

  def search_params
    params.permit(Item.attribute_names)
  end

end
