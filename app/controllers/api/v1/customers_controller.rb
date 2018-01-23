class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

  def create
    customer = Customer.create(customer_params)
    render_id_and_errors(customer)
  end

  def update
    customer = Customer.update(params[:id], customer_params)
    render_id_and_errors(customer)
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end

end
