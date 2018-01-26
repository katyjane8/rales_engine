class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    name = params[:merchant_id] ? :revenue : :total_revenue
    value = Invoice.where(search_params).total_revenue
    render json: { name => in_dollars(value) }
  end

private

  def search_params
    if params[:date]
      datetime = DateTime.parse(params[:date])
      params[:updated_at] = whole_day(datetime)
    end
    params.permit(:merchant_id, :created_at)
  end

  def whole_day(datetime)
    (datetime.beginning_of_day)..(datetime.end_of_day)
  end

end
