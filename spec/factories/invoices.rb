FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status "shipped"
    created_at "2018-01-23 17:37:07"
    updated_at "2018-01-23 17:37:09"
  end
end
