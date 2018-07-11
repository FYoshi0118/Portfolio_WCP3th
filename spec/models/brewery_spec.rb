require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe '正常系のテスト' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:brewery)).to be_valid
    end

    it 'has a valid factory(add to phone_number, email, url)' do
      expect(FactoryBot.build(:brewery, phone_number: '0729550018', email: 'email@nazo.com', url: 'http://www.fujimotosyuzou.com/index.html')).to be_valid
    end
  end

  describe '異常系のテスト' do
    context 'when the value is empty' do
      it 'is invalid without a name' do
        brewery = FactoryBot.build(:brewery, name: nil)
        brewery.valid?
        expect(brewery.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without a name_kana' do
        brewery = FactoryBot.build(:brewery, name_kana: nil)
        brewery.valid?
        expect(brewery.errors[:name_kana]).to include("can't be blank")
      end

      it 'is invalid without a post_code' do
        brewery = FactoryBot.build(:brewery, post_code: nil)
        brewery.valid?
        expect(brewery.errors[:post_code]).to include("can't be blank")
      end

      it 'is invalid without a address' do
        brewery = FactoryBot.build(:brewery, address: nil)
        brewery.valid?
        expect(brewery.errors[:address]).to include("can't be blank")
      end
    end
  end

end
