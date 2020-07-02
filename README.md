# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#78期 aチーム フリマアプリ DB設計
# usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unque: false|
|password|string|null: false|
|user_image|string|null: false|
|birthday|date|null: false|
### Association
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"


# itemsテーブル
|Column|Type|Options|
|name|string|null: false|
|introduction|string|null: false|
|condition|string|null: false|
|price|integer|null: false|
|category_id|integer|null: false, unque: false|
|shipping_charges_id|reference|null: false, unque: false|
|shipping_from_id|reference|null: false, unque: false|
|shipping_days_id|reference|null: false, unque: false|
|item_image_id|reference|null: false, unque: false|
|seller_id|reference|null: false, unque: false|
|buyer_id|reference|null: false, unque: false|
### Association
- has_many :item_imgs, dependent: :destroy
- berongs_to :categorie
- berongs_to :shipping_charge
- berongs_to :shipping_from
- berongs_to :shipping_charge
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
|prefectuer|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string|null: false|
|phone_number|integer|null: false, unque: false|
|user_id|references|null: false, foreign_key: true|
### Association
- berongs_to :user, :optional	true

# credit_cardsテーブル
|Column|Type|Options|
|customer_id|string|null: false, unque: false|
|card_id|string|null: false, unque: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- berongs_to :user

# shipping_chargesテーブル
|Column|Type|Options|
|shipping_charge|string|null: false|
### Association
- hasmany :items

# shipping_fromsテーブル
|Column|Type|Options|
|shipping_froms|string|null: false|
### Association
- hasmany :items

# shipping_daysテーブル
|Column|Type|Options|
|shipping_days|string|null: false|
### Association
- hasmany :items

# categoriesテーブル
|Column|Type|Options|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- hasmany :items

# item_imageテーブル
|Column|Type|Options|
|image|string|null: false|
|item_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :item

# commentsテーブル(仮)
|Column|Type|Options|
|comment|text|null: false|
|item-id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item