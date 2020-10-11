FactoryBot.define do
  factory :delivery_address do
    association :order
  end
end
