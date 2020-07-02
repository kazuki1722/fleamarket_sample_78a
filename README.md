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

# credit_cardsテーブル
|Column|Type|Options|
|customer_id|string|null: false, unque: false|
|card_id|string|null: false, unque: false|
|user_id|reference|null: false, foreign_key: true|
### Association

# shipping_chargesテーブル
|Column|Type|Options|
|shipping_charge|string|null: false|
### Association

# shipping_fromsテーブル
|Column|Type|Options|
|shipping_froms|string|null: false|
### Association

# shipping_daysテーブル
|Column|Type|Options|
|shipping_days|string|null: false|
### Association

# commentsテーブル(予定)
|Column|Type|Options|
### Association