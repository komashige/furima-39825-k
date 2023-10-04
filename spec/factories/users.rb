FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            { "太郎" }
    last_name             { "山田" }
    first_name_kana       { "タロウ" }  
    last_name_kana        { "ヤマダ" }   
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email                 { Faker::Internet.unique.email }
    password              { "password123" }  
    password_confirmation { password }

  end
end