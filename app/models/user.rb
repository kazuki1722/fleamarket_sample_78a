class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday,presence: true
  validates :family_name, :first_name, :family_name_kana, :first_name_kana,format: { with: /\A[一-龥ぁ-ん]/ }
  # 漢字ひらがな全角
  has_one :address
end
