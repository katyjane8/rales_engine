class Api::V1::Items::BestDayController < ApplicationController

  def show
    bestie = Item.find_by(item_params)
    render json: bestie.best_day
  end

  private

    def item_params
      params.permit(Item.attribute_names)
    end
end
