class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    name = params[:merchant_id] ? :revenue : :total_revenue
    value = Invoice.where(search_params).total_revenue
    render json: { name => in_dollars(value) }
  end

private

  def search_params
    permitted = {}
    if params[:date]
      datetime = DateTime.parse(params[:date])
      permitted[:updated_at] = whole_day(datetime)
    end
    permitted[:merchant_id] = params[:merchant_id] if params[:merchant_id]
    permitted
  end

  def whole_day(datetime)
    (datetime.beginning_of_day)..(datetime.end_of_day)
  end

end
