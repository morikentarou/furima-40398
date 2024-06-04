FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.characters(number: 39) }
    description           { Faker::Lorem.characters(number: 999) }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    condition_id          { Faker::Number.between(from: 2, to: 7) }
    delivery_id           { Faker::Number.between(from: 2, to: 3) }
    area_id               { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
