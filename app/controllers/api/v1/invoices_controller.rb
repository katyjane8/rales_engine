class Api::V1::InvoicesController < ApplicationController

  def index
    render json: Invoice.all
  end

  def show
    render json: Invoice.find(params[:id])
  end

  def create
    invoice = Invoice.create(invoice_params)
    render_id_and_errors(invoice)
  end

  def update
    invoice = Invoice.update(params[:id], invoice_params)
    render_id_and_errors(invoice)
  end

private

  def invoice_params
    params.require(:invoice).permit(
      :customer_id,
      :merchant_id,
      :status
    )
  end

end
