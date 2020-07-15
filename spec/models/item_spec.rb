require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#search" do
    it "search aaa" do
      item = create(:item)
      item.item_images << create(:item_image)
      other_item = create(:item, name: "bbbb")
      other_item.item_images << create(:item_image)
      expect(Item.search(a)).to eq(item)
    end
  end
end