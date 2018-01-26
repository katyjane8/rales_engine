class Api::V1::Invoices::SearchController < SearchController

  def index
    render json: Invoice.where(search_params)
  end

  def show
    render json: Invoice.find_by(search_params)
  end

private

  def search_params
    super.permit(
      :customer_id,
      :merchant_id,
      :status,
      :created_at,
      :updated_at,
      :id
    )
  end

end
