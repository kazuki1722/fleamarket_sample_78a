class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, length: { maximum: 40 }, presence: true
  validates :introduction, :condition_id, :price, :shipping_charges_id, :shipping_from_id, :shipping_day_id, presence: true
  validates :image, presence: true
  validates :price, :numericality => { :greater_than => 299 }
  validates :price, :numericality => { :less_than => 9999999 }

  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  
  belongs_to :user 
  belongs_to :category
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_day
end
