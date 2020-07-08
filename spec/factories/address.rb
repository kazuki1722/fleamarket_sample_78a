FactoryBot.define do

  factory :address do
    address_family_name       {"山田"}
    address_first_name        {"太郎"}
    address_family_name_kana  {"やまだ"}
    address_first_name_kana   {"たろう"}
    zipcode                   {"111-1111"}
    prefecture                {"丸丸県"}
    city                      {"丸丸市"}
    house_number              {"１丁目１番１号"}
    building                  {"マンション000号室"}
    phone_number              {"000-0000-0000"}
  end

end