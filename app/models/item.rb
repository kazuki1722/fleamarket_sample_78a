class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  belongs_to :user

 
end