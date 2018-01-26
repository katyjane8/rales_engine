class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end

  def show
    render json: Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.create(merchant_params)
    render_id_and_errors(merchant)
  end

  def update
    merchant = Merchant.update(params[:id], merchant_params)
    render_id_and_errors(merchant)
  end

private

  def merchant_params
    params.require(:merchant).permit(:id, :name)
  end

end
