FactoryBot.define do
  factory :sns_credential do
    provider {"facebook"}
    uid      {"200000000000000000000"}
    user     { nil }
  end
end
