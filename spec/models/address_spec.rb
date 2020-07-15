require 'rails_helper'

describe Address do
  describe '#create_address' do
    context "can save" do
      it "is valid with a address_family_name, address_first_name,
          address_family_name_kana, address_first_name_kana, 
          zipcode, prefecture, city, house_number,
          building, phone_number" do
        expect(build(:address)).to be_valid
      end

      it "is valid without a building" do
        address = build(:address, building: "")
        expect(address).to be_valid
      end

      it "is valid without a phone_number" do
        address = build(:address, phone_number: "")
        expect(address).to be_valid
      end
    end

    context "can't save" do
      it "is invalid without an address_family_name" do
        address = build(:address, address_family_name: "")
        address.valid?
        expect(address.errors[:address_family_name]).to include("can't be blank")
      end

      it "is invalid without an address_first_name" do
        address = build(:address, address_first_name: "")
        address.valid?
        expect(address.errors[:address_first_name]).to include("can't be blank")
      end

      it "is invalid without an address_family_name_kana" do 
        address = build(:address, address_family_name_kana: "")
        address.valid?
        expect(address.errors[:address_family_name_kana]).to include("can't be blank")
      end

      it "is invalid without an address_first_name_kana" do
        address = build(:address, address_first_name_kana: "")
        address.valid?
        expect(address.errors[:address_first_name_kana]).to include("can't be blank")
      end

      it "is invalid without a zipcode" do
        address = build(:address, zipcode: "")
        address.valid?
        expect(address.errors[:zipcode]).to include("can't be blank")
      end

      it "is invalid without a prefecture" do
        address = build(:address, prefecture: "")
        address.valid?
        expect(address.errors[:prefecture]).to include("can't be blank")
      end

      it "is invalid without a city" do
        address = build(:address, city: "")
        address.valid?
        expect(address.errors[:city]).to include("can't be blank")
      end

      it "is invalid without a house_number" do
        address = build(:address, house_number: "")
        address.valid?
        expect(address.errors[:house_number]).to include("can't be blank")
      end

    end

    context "if the format is correct" do

      let(:address) { build(:address) }

      it "is valid with an address_family_name that is written in kanji" do
        expect(address.address_family_name).to match(/\A[一-龥ぁ-ん]+\z/)
      end

      it "is valid with an address_first_name that is written in kanji" do
        expect(address.address_first_name).to match(/\A[一-龥ぁ-ん]+\z/)
      end

      it "is valid with an address_family_name_kana that is written in hiragana" do
        expect(address.address_family_name_kana).to match(/\A[ぁ-んー－]+\z/)
      end

      it "is valid with an address_first_name that is written in hiragana" do
        expect(address.address_first_name_kana).to match(/\A[ぁ-んー－]+\z/)
      end

      it "is valid with a zipcode that is 7 digit integer" do
        expect(address.zipcode).to match(/\A\d{7}\z/)
      end

    end

  end
end