class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end

  def create
    invoice_item = InvoiceItem.create(invoice_item_params)
    render_id_and_errors(invoice_item)
  end

  def update
    invoice_item = InvoiceItem.update(params[:id], invoice_item_params)
    render_id_and_errors(invoice_item)
  end

private

  def invoice_item_params
    params.require(:invoice_item).permit(
      :item_id,
      :invoice_id,
      :quantity,
      :unit_price,
    )
  end

end
