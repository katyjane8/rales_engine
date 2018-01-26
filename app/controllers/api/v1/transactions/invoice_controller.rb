class Api::V1::Transactions::InvoiceController < ApplicationController

  def show
    Transaction.find(params[:transaction_id]).invoice
  end

end
