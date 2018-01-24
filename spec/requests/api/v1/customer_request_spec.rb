require 'rails_helper'

describe "Customer API" do
  before :each do
    @x = create(:customer)
    create_list(:customer, 5)
  end

  it "sends a list of customers" do
    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(6)
  end

  it "can get one customer by its id" do
    get "/api/v1/customers/#{@x.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(@x.id)
  end

  it "can find one customer by id params" do
    get "/api/v1/customers/find?id=#{@x.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(@x.id)
  end

  it "can find one customer by first name" do
    get "/api/v1/customers/find?first_name=#{@x.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(@x.first_name)
  end

  it "can find one customer by last name" do
    get "/api/v1/customers/find?last_name=#{@x.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq(@x.last_name)
  end

  it "can find one customer by time created at" do
    get "/api/v1/customers/find?#{@x.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(@x.first_name)
  end

  it "can find one customer by time updated at" do
    get "/api/v1/customers/find?#{@x.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(@x.first_name)
  end

  it "can find all customers by id params" do
    get "/api/v1/customers/find_all?id=#{@x.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(@x.id)
  end

  it "can find all customers by first name params" do
    get "/api/v1/customers/find_all?first_name=#{@x.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["first_name"]).to eq(@x.first_name)
  end

  it "can find all customers by last name params" do
    get "/api/v1/customers/find_all?last_name=#{@x.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["last_name"]).to eq(@x.last_name)
  end

  it "can find all customers by created_at params" do
    get "/api/v1/customers/find_all?#{@x.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(@x.id)
  end

  it "can find all customers by updated_at params" do
    get "/api/v1/customers/find_all?#{@x.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(customer.first["id"]).to eq(@x.id)
  end
end
