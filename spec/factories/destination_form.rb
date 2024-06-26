FactoryBot.define do
  factory :destination_form do
    post_code        { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    area_id          { Faker::Number.between(from: 2, to: 48) }
    municipality     { Faker::Lorem.characters(number: 10) }
    street           { Faker::Lorem.characters(number: 10) }
    building         { Faker::Lorem.characters(number: 10) }
    tel              { Faker::Number.between(from: 10**9, to: 10**11) }
    token            { 'tok_abcdefghijk00000000000000000' }
    price            { 500 }
  end
end
