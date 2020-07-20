class Like < ApplicationRecord
  belongs_to :item, counter_cache: :likes_count
  belongs_to :user
end
