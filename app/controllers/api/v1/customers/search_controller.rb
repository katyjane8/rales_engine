class Api::V1::Customers::SearchController < SearchController

  def index
    render json: Customer.where(search_params)
  end

  def show
    render json: Customer.find_by(search_params)
  end

private

  def search_params
    super.permit(
      :first_name,
      :last_name,
      :created_at,
      :updated_at,
      :id
    )
  end

end
