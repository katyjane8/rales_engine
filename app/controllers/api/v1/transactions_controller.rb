class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find(params[:id])
  end

  def create
    transaction = Transaction.create(transaction_params)
    render_id_and_errors(transaction)
  end

  def update
    transaction = Transaction.update(params[:id], transaction_params)
    render_id_and_errors(transaction)
  end

private

  def transaction_params
    params.require(:ransaction).permit(
      :credit_card_number,
      :credit_card_expiration_date,
      :result
    )
  end

end
