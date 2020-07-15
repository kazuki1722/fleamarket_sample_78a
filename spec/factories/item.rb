FactoryBot.define do

  factory :item do
    item_images           { nil }
    name                  {"aaaa"}
    introduction          {"bbbbbbbbbbb"}
    price                 {"12345"}
    condition_id          {"1"}
    shipping_charge_id    {"1"}
    shipping_day_id       {"1"}
    prefecture_id         {"1"}
    brand                 {"ブランド"}
    seller                { nil }
    buyer                 { nil }
    category              { nil }
    user                  { nil }
  end

end