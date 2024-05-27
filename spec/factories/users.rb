FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email }
    password              {Faker::Internet.password(min_length: 6 , mix_case: true, special_characters: false) + "1a"}
    password_confirmation {password}
    last_name             {Faker::Name.initials}
    first_name            {Faker::Name.initials}
    reading_last_name     { ["タナカ", "スズキ", "サトウ", "コバヤシ", "イシカワ"].sample }
    reading_first_name    { ["タロウ", "ハナコ", "ジロウ", "サチコ", "ユウキ"].sample }
    birthday              { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end