class Api::V1::Merchants::SearchController < SearchController

  def index
    render json: Merchant.where(search_params)
  end

  def show
    render json: Merchant.find_by(search_params)
  end

private

  def search_params
    super.permit(
      :name,
      :created_at,
      :updated_at,
      :id
    )
  end

end
