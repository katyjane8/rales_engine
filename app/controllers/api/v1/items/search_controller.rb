class Api::V1::Items::SearchController < SearchController

  def index
    render json: Item.where(search_params)
  end

  def show
    render json: Item.where(search_params).order(:id).first
  end

private

  def search_params
    super.permit(
      :merchant_id,
      :name,
      :description,
      :unit_price,
      :created_at,
      :updated_at,
      :id
    )
  end

end
