class ItemImage < ApplicationRecord
  mount_uploader :image, ItemImageUploader
  belongs_to :item
end
