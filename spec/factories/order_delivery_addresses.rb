FactoryBot.define do
  factory :order_delivery_address do
    p_code          { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id   { Faker::Number.between(from: 1, to: 47)  }
    cities          { Gimei.address.city.kanji }
    address         { "#{Gimei.address.town.kanji}#{Faker::Number.between(from: 1, to: 10)}-#{Faker::Number.between(from: 1, to: 10)}" }
    building_name   { "赤坂檜町ザ・タワー999" }
    phone_num       { Faker::Number.number(digits: 11) }
    token           {"tok_abcdefghijk00000000000000000"}
  end
end
