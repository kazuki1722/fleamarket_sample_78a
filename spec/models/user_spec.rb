require 'rails_helper'

describe User do
  describe "#create" do
    it "is valid with a nickname, family_name, first_name, family_name_kana,
        first_name_kana, birthday, email, password, password_confirmation" do
      expect(build(:user)).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a family_name_kana" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    context "if the format is correct" do

      let(:user) { build(:user) }

      it "is valid with a family_name that is written in kanji" do
        expect(user.family_name).to match(/\A[一-龥]+\z/)
      end

      it "is valid with a first_name that is written in kanji" do
        expect(user.first_name).to match(/\A[一-龥]+\z/)
      end

      it "is valid with a family_name_kana that is written in hiragana" do
        expect(user.family_name_kana).to match(/\A[ぁ-んー－]+\z/)
      end

      it "is valid with a first_name that is written in hiragana" do
        expect(user.first_name_kana).to match(/\A[ぁ-んー－]+\z/)
      end

    end
  end

  describe "#omniauth" do
    it "Have authenticated sns" do
      auth = request_omniauth_mock
      user = create(:user, email: auth.info.email)
      # 既に登録済みのユーザー
      sns = create(:sns_credential,
        provider: auth.provider,
        uid: auth.uid,
        user_id: nil || user.id
      )
      # userが持っているsns
      sns.user_id = user.id
      # userが持っているsnsの更新
      expect(User.from_omniauth(auth)).to eq({user: user, sns: sns})
    end

    context "never authenticated sns" do

      it "I haven't registered an email yet" do
        auth = request_omniauth_mock
        sns = create(:sns_credential,
          provider: auth.provider,
          uid: auth.uid,
          user_id: nil
        )
        # snsをビルド
        user = build(:user,
          nickname: auth.info.name,
          family_name: nil,
          first_name: nil,
          family_name_kana: nil,
          first_name_kana: nil,
          birthday: nil,
          email: auth.info.email,
          password: nil,
          password_confirmation: nil
        )
        # userをビルド
        # expect(User.from_omniauth(auth)).to eq({sns: sns, user: user})
        expect(User.from_omniauth(auth)[:user][:email]).to eq(user.email)
      end
      
      it "I have registered an email" do
        auth = request_omniauth_mock
        sns = create(:sns_credential,
          provider: auth.provider,
          uid: auth.uid,
          user_id: nil
        )
        # snsをビルド
        user = create(:user, email: "john@example.com")
        # 既に存在するユーザー
        sns.user_id = user.id
        # userが持つsnsを更新
        expect(User.from_omniauth(auth)).to eq({user: user, sns: sns})
      end
      
    end
  end
end