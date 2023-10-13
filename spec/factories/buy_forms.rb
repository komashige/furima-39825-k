FactoryBot.define do
  factory :buy_form do
    post_code { "123-4567" } 
    ship_area_id { 2 } 
    city { "横浜市緑区" }
    street_address { "青山1-1-1" }
    building_name { "柳ビル103" }
    telephone_number { "09012345678" } 
  end
end
