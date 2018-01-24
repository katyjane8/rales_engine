class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.create(item_params)
    render_id_and_errors(item)
  end

  def update
    item = Item.update(params[:id], item_params)
    render_id_and_errors(item)
  end

private

  def item_params
    params.require(:item).permit(
      :merchant_id,
      :name,
      :description,
      :unit_price
    )
  end

end
