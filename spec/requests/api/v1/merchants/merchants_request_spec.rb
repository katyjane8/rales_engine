require 'rails_helper'

describe "Merchants API" do
  before :each do
    create_list(:merchant, 3)
  end

  it "sends a list of merchants" do
    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(id)
  end

  it "can find one merchant by id params" do
    x = create(:merchant)

    get "/api/v1/merchants/find?id=#{x.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(x.id)
  end

  it "can find one merchant by name" do
    x = create(:merchant)

    get "/api/v1/merchants/find?name=MyString"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(x.name)
  end

  it "can find one merchant by time created at" do
    x = create(:merchant)

    get "/api/v1/merchants/find?#{x.created_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(x.name)
  end

  it "can find one merchant by time updated at" do
    x = create(:merchant)

    get "/api/v1/merchants/find?#{x.updated_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(x.name)
  end

  it "can find all merchants by id params" do
    x = create(:merchant)

    get "/api/v1/merchants/find_all?id=#{x.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant.first["id"]).to eq(x.id)
  end

  it "can find all merchants by name params" do
    x = create(:merchant)

    get "/api/v1/merchants/find_all?name=#{x.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant.first["name"]).to eq(x.name)
  end

  it "can find all merchants by created_at params" do
    x = create(:merchant)

    get "/api/v1/merchants/find_all?#{x.created_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant.first["name"]).to eq(x.name)
  end

  it "can find all merchants by updated_at params" do
    x = create(:merchant)

    get "/api/v1/merchants/find_all?#{x.updated_at}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant.first["name"]).to eq(x.name)
  end

  # it "can find a random merchant" do
  #   get "api/v1/merchants/random.json"
  # 
  #   expect(response).to be_successful
  #
  #   # merchant = JSON.parse(response.body)
  #   #
  #   # expect(merchant.first["name"]).to eq(x.name)
  # end
end
