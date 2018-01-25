require 'rails_helper'

describe "Customer API" do
  before :each do
    @customer = create(:customer)
    create_list(:customer, 5)
  end

  it "sends a list of customers" do
    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(6)
  end

  it "can get one customer by its id" do
    get "/api/v1/customers/#{@customer.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(@customer.id)
  end

  it "can find one customer by id params" do
    get "/api/v1/customers/find?id=#{@customer.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(@customer.id)
  end

  it "can find one customer by first name" do
    get "/api/v1/customers/find?first_name=#{@customer.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(@customer.first_name)
  end

  it "can find one customer by last name" do
    get "/api/v1/customers/find?last_name=#{@customer.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq(@customer.last_name)
  end

  it "can find one customer by time created at" do
    get "/api/v1/customers/find?#{@customer.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(@customer.first_name)
  end

  it "can find one customer by time updated at" do
    get "/api/v1/customers/find?#{@customer.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(@customer.first_name)
  end

  it "can find all customers by id params" do
    get "/api/v1/customers/find_all?id=#{@customer.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(@customer.id)
  end

  it "can find all customers by first name params" do
    get "/api/v1/customers/find_all?first_name=#{@customer.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["first_name"]).to eq(@customer.first_name)
  end

  it "can find all customers by last name params" do
    get "/api/v1/customers/find_all?last_name=#{@customer.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["last_name"]).to eq(@customer.last_name)
  end

  it "can find all customers by created_at params" do
    get "/api/v1/customers/find_all?#{@customer.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(@customer.id)
  end

  it "can find all customers by updated_at params" do
    get "/api/v1/customers/find_all?#{@customer.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(@customer.id)
  end
end
