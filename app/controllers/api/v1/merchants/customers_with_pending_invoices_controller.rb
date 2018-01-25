class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def index
    render json: Customer.with_pending_invoices_for_merchant(params[:merchant_id])
  end
end
