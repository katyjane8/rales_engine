FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity 100
    unit_price 500
    created_at "2018-01-23 17:37:09"
    updated_at "2018-01-23 17:37:09"
  end
end
