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
## usersテーブル
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

# Addressテーブル
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
|user_id|references||
### Association

# Addressテーブル
### Association

# Addressテーブル
### Association

# Addressテーブル
### Association