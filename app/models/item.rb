class Item < ApplicationRecord
  has_many :item_imgs, dependent: :destroy
  berongs_to :categorie
  berongs_to :shipping_charge
  berongs_to :shipping_from
  berongs_to :shipping_charge
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
end