class User < ApplicationRecord
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :email,presence: true
  validates :family_name, :first_name, format: { with: /\A[一-龥ぁ-ん]+\z/ }
  # 漢字ひらがな
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
  # ひらがな
  has_one :address
  has_one :credit_card, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item
  has_many :items, through: :likes, source: :item
end
