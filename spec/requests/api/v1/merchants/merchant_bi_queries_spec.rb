require 'rails_helper'

describe "Merchants BI endpoints API" do
  before :each do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    @merchant3 = create(:merchant)
    @customer = create(:customer)
    item = create(:item, merchant: @merchant1)
    invoice1 = create(:invoice, merchant: @merchant1, customer: @customer)
    invoice2 = create(:invoice, merchant: @merchant2, customer: @customer)
    invoice3 = create(:invoice, merchant: @merchant3, customer: @customer)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)
    transaction4 = create(:transaction, invoice: invoice1)
    transaction5 = create(:transaction, invoice: invoice2)
    transaction6 = create(:transaction, invoice: invoice3)
    create(:invoice_item, item: item, invoice: invoice1, unit_price: item.unit_price)
    create(:invoice_item, item: item, invoice: invoice1, unit_price: item.unit_price)
    create(:invoice_item, item: item, invoice: invoice2, unit_price: item.unit_price)
    create(:invoice_item, item: item, invoice: invoice2, unit_price: item.unit_price)
    create(:invoice_item, item: item, invoice: invoice3, unit_price: item.unit_price)
    create(:invoice_item, item: item, invoice: invoice3, unit_price: item.unit_price)
  end

  it "returns total revenue for merchant by id" do
    get "/api/v1/merchants/#{@merchant1.id}/revenue"

    expect(response).to be_successful

    merch = JSON.parse(response.body)

    expect(merch).to eq({"revenue" =>"300428.00"})
  end

  it "returns the total revenue for merchant for a specific invoice date" do
    get "/api/v1/merchants/#{@merchant1.id}/revenue?date='2018-01-23 17:37:09'"

    expect(response).to be_successful

    merch = JSON.parse(response.body)

    expect(merch).to eq({"revenue" =>"300428.00"})
  end

  it "returns the top merchants ranked by total number of items sold" do
    get "/api/v1/merchants/most_items?quantity=4"

    expect(response).to be_successful

    merch = JSON.parse(response.body)

    expect(merch.count).to eq(3)
    expect(merch.first["id"]).to eq(@merchant1.id)
  end
end
