# 78期 aチーム フリマアプリ DB設計

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|user_image|string|null: false|
|birthday|date|null: false|
### Association
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_many :comments dependent: :destroy
- has_one :credit_cards dependent: :destroy
- has_one :address dependent: :destroy


# itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|condition|string|null: false|
|price|integer|null: false|
|category|integer|null: false|
|shipping_charges|reference|null: false|
|shipping_from|reference|null: false|
|shipping_days|reference|null: false|
|seller|reference|null: false|
|buyer|reference|null: false|
### Association
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :shipping_charge
- belongs_to :shipping_from
- belongs_to :shipping_charge
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

# addressテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string|null: false|
|phone_number|integer|null: false, unique: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user, :optional	true, dependent: :destroy

# credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false, unque: false|
|card_id|string|null: false, unque: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user

# shipping_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_charge|string|null: false|
### Association
- hasmany :items

# shipping_fromsテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_forms|string|null: false|
### Association
- hasmany :items

# shipping_daysテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_days|string|null: false|
### Association
- hasmany :items

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items

# item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item

# commentsテーブル(仮)
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|item_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item