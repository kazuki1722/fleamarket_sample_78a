class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :email,presence: true
  validates :family_name, :first_name, format: { with: /\A[一-龥]+\z/ }
  # 漢字
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
  # ひらがな
  has_one :address
end
