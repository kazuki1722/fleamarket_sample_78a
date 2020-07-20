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

  describe '#create' do
    it 'image, name, introduction, price, category_id, condition_id, prefecture_id, shipping_charge_id, shipping_day_id, seller_idがあれば出品できること' do
      user = create(:user)
      item = build(:item, seller_id: user[:id])
      expect(item).to be_valid
    end
    it 'brandがなくても出品できること' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], brand: nil)
      expect(item).to be_valid
    end
    it 'imageが0枚だと出品できないこと' do
      user = create(:user)
      item = Item.new(name: "abc", introduction: "abc", price: 1000, condition_id: 1, shipping_charge_id: 1, shipping_day_id: 1, prefecture_id: 1, category_id: 1, seller_id: user[:id])
      item.valid?
    end
    it 'nameがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], name: nil)
      item.valid?
    end
    it 'nameが40字以上だと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], name: "1111111111222222222233333333334444444444555555555")
      item.valid?
    end
    it 'introductionがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], introduction: nil)
      item.valid?
    end
    it 'priceがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], price: nil)
      item.valid?
    end
    it 'condition_idがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], condition_id: nil)
      item.valid?
    end
    it 'shipping_charge_idがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], shipping_charge_id: nil)
      item.valid?
    end
    it 'shipping_day_idがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], shipping_day_id: nil)
      item.valid?
    end
    it 'prefecture_idがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], prefecture_id: nil)
      item.valid?
    end
    it 'category_idがないと出品できないこと' do
      user = create(:user)
      item = build(:item, seller_id: user[:id], category_id: nil)
      item.valid?
    end
  end
end