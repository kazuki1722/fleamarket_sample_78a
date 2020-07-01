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
|family_name|string|
|first_name|string|
|family_name_kana|string|
|first_name_kana|string|
|nickname|string|
|email|string|
|password|string|
|image|text|
|Birthday|date|
### Association