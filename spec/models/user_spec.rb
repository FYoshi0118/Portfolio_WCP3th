require 'rails_helper'

RSpec.describe User, type: :model do
  describe "normal system test" do
    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end
    
    it "the default for status is 0" do
      user = FactoryBot.build(:user)
      expect(user.status).to eq 0
    end

    it "status is 1" do
      user = FactoryBot.build(:user, status: 1)
      expect(user.status).to eq 1
    end

    it "status is 2" do
      user = FactoryBot.build(:user, status: 2)
      expect(user.status).to eq 2
    end
  end

  describe "error system test" do
    context "when the value is empty" do
      it "is invalid without name_code" do
        user = FactoryBot.build(:user, name_code: nil)
        user.valid?
        expect(user.errors[:name_code]).to include("can't be blank")
      end

      it "is invalid without nickname" do
        user = FactoryBot.build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "is invalid without email" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
    end

    context "when the value is duplicate" do
      it "is invalid duplicate name_code" do
        FactoryBot.create(:user, name_code: "test")
        user = FactoryBot.build(:user, name_code: "test")
        user.valid?
        expect(user.errors[:name_code]).to include("has already been taken")
      end

      it "is invalid duplicate email" do
        FactoryBot.create(:user, email: "test@test.com")
        user = FactoryBot.build(:user, email: "test@test.com")
        user.valid?
        expect(user.errors[:email]).to include("has already been taken")
      end
    end

    context "入力制限の確認" do
      it "name_codeが21文字以上なら無効な状態であること"
      it "name_codeが半角英数字と-_以外なら無効な状態であること"
      it "passwordが5文字以下なら無効な状態であること"
      it "passwordが21文字以上なら無効な状態であること"
      it "introductionが201文字以上なら無効な状態であること"
    end
  end
end
