class Api::V1::InvoiceItems::SearchController < SearchController

  def index
    render json: InvoiceItem.where(search_params)
  end

  def show
    render json: InvoiceItem.find_by(search_params)
  end

private

  def search_params
    super.permit(
      :item_id,
      :invoice_id,
      :quantity,
      :unit_price,
      :created_at,
      :updated_at,
      :id
    )
  end

end
