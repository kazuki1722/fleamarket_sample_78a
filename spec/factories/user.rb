FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    family_name           {"山田"}
    first_name            {"た郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    birthday              {"2001-01-01"}
    email                 {Faker::Internet.free_email}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end
end