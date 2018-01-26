require 'rails_helper'

describe "Transaction API" do
  before :each do
    customer = create(:customer)
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    @x = create(:transaction, invoice: invoice)
    create_list(:transaction, 5, invoice: invoice)
  end

  it "sends a list of transactions" do
    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(6)
  end

  it "can get one transaction by its id" do
    get "/api/v1/transactions/#{@x.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(@x.id)
  end

  it "can find one transaction by id params" do
    get "/api/v1/transactions/find?id=#{@x.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(@x.id)
  end

  it "can find one transaction by invoice id" do
    get "/api/v1/transactions/find?invoice_id=#{@x.invoice_id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["invoice_id"]).to eq(@x.invoice_id)
  end

  it "can find one transaction by credit card number" do
    get "/api/v1/transactions/find?credit_card_number=4354495077693036"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(@x.id)
  end

  it "can find one transaction by result of transaction" do
    get "/api/v1/transactions/find?result=success"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(@x.id)
  end

  it "can find one transaction by time created at" do
    get "/api/v1/transactions/find?#{@x.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(@x.id)
  end

  it "can find one transaction by time updated at" do
    get "/api/v1/transactions/find?#{@x.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(@x.id)
  end

  it "can find all transactions by id params" do
    get "/api/v1/transactions/find_all?id=#{@x.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(@x.id)
  end

  it "can find all transactions by credit_card_number params" do
    get "/api/v1/transactions/find_all?credit_card_number=#{@x.credit_card_number}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction.first["credit_card_number"]).to eq(@x.credit_card_number)
  end

  it "can find all transactions by created_at params" do
    get "/api/v1/transactions/find_all?#{@x.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(@x.id)
  end

  it "can find all transactions by updated_at params" do
    get "/api/v1/transactions/find_all?#{@x.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(@x.id)
  end
end
