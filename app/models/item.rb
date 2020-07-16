class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, length: { maximum: 40 }, presence: true
  validates :introduction, :condition_id, :price, :shipping_charge_id, :prefecture_id, :shipping_day_id, presence: true
  validates :price, :numericality => { :greater_than => 299 }
  validates :price, :numericality => { :less_than => 9999999 }
  validates :item_images, presence: true

  has_many :item_images, dependent: :destroy

  accepts_nested_attributes_for :item_images, allow_destroy: true
  
  belongs_to :user, optional: true

  belongs_to :category
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day

  def precious
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
