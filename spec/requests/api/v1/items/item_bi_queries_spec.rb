require 'rails_helper'

describe "Items BI endpoints API" do
  before :each do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    @merchant3 = create(:merchant)
    @customer = create(:customer)
    @item1 = create(:item, merchant: @merchant1)
    @item2 = create(:item, merchant: @merchant1)
    invoice1 = create(:invoice, merchant: @merchant1, customer: @customer)
    invoice2 = create(:invoice, merchant: @merchant2, customer: @customer)
    invoice3 = create(:invoice, merchant: @merchant3, customer: @customer)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)
    transaction4 = create(:transaction, invoice: invoice1)
    transaction5 = create(:transaction, invoice: invoice2)
    transaction6 = create(:transaction, invoice: invoice3)
    create(:invoice_item, item: @item1, invoice: invoice1, unit_price: @item1.unit_price)
    create(:invoice_item, item: @item1, invoice: invoice1, unit_price: @item1.unit_price)
    create(:invoice_item, item: @item2, invoice: invoice2, unit_price: @item2.unit_price)
    create(:invoice_item, item: @item2, invoice: invoice2, unit_price: @item2.unit_price)
    create(:invoice_item, item: @item2, invoice: invoice3, unit_price: @item2.unit_price)
    create(:invoice_item, item: @item2, invoice: invoice3, unit_price: @item2.unit_price)
  end

  it "returns the date with the most sales for the given item using the invoice date" do
    get "/api/v1/items/#{@item1.id}/best_day"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    
    expect(item["best_day"]).to eq("2018-01-23T17:37:07.000Z")
  end

  it "returns the top item instances ranked by total number sold" do
    get "/api/v1/items/most_items?quantity=5"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item.count).to eq(2)
    expect(item.first["id"]).to eq(@item2.id)
  end
end
