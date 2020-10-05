FactoryBot.define do
  factory :item do
    name                 { Faker::JapaneseMedia::DragonBall.character }
    description          { Faker::Base.regexify("[aあ]{32}") }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    status_id            { Faker::Number.between(from: 2, to: 7) }
    delivery_burden_id   { Faker::Number.between(from: 2, to: 3) }
    shipment_source_id   { Faker::Number.between(from: 1, to: 47) }
    day_to_ship_id       { Faker::Number.between(from: 2, to: 4) }
    price                { Faker::Number.between(from: 300, to: 9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
