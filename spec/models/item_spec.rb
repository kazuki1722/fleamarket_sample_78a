require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#search" do
    it "search aaa" do
      item = create(:item)
      other_item = create(:item, name: "bbbb")
      expect(Item.search("a")).to include(item)
    end

    it "search Item.all" do
      items = create_list(:item, 10)
      expect(Item.search(nil)).to eq(items)
    end
  end

end