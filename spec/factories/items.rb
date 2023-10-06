FactoryBot.define do
  factory :item do
    name { "商品名" }
    description { "商品の説明" }
    category_id { 2 } 
    condition_id { 2 }
    ship_cost_id { 2 }
    ship_area_id { 2 }
    ship_day_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
