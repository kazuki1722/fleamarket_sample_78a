FactoryBot.define do

  factory :item do
    name                  {"aaaa"}
    introduction          {"bbbbbbbbbbb"}
    price                 {"12345"}
    condition_id          {"1"}
    shipping_charge_id    {"1"}
    shipping_day_id       {"1"}
    prefecture_id         {"1"}
    brand                 {"ブランド"}
    seller                { create(:user) }
    buyer                 { nil }
    category  
    # user                  { nil }
    after(:build) do |item|
      item.item_images << build(:item_image)
    end
  end

end