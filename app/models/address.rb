class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :address_family_name, :address_first_name, :address_family_name_kana, :address_first_name_kana, :zipcode, :prefecture, :city, :house_number,presence: true 
  validates :address_family_name, :address_first_name, format: { with: /\A[一-龥ぁ-ん]+\z/ }
  # 漢字ひらがな
  validates :address_family_name_kana, :address_first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
  # ひらがな
  validates :zipcode, format: { with: /\A\d{7}\z/ }
end
