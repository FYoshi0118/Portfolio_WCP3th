require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'noraml system test'do
    it 'has a valid factory' do
      expect(FactoryBot.build(:admin)).to be_valid
    end

    it 'the default for is_main_administer is false' do
      admin = FactoryBot.build(:admin)
      admin.valid?
      expect(admin.is_main_administer).to eq false
    end

    it 'the default for is_deleted is false' do
      admin = FactoryBot.build(:admin)
      admin.valid?
      expect(admin.is_deleted).to eq false
    end
  end

  describe 'error system test' do
    context 'when the value is empty' do
      it 'is invalid without a family_name' do
        admin = FactoryBot.build(:admin, family_name: nil)
        admin.valid?
        expect(admin.errors[:family_name]).to include("can't be blank")
      end

      it 'is invalid without a given_name' do
        admin = FactoryBot.build(:admin, given_name: nil)
        admin.valid?
        expect(admin.errors[:given_name]).to include("can't be blank")
      end

      it 'is invalid without an email' do
        admin = FactoryBot.build(:admin, email: nil)
        admin.valid?
        expect(admin.errors[:email]).to include("can't be blank")
      end

      it 'is invalid without an is_main_administer' do
        admin = FactoryBot.build(:admin, is_main_administer: nil)
        admin.valid?
        expect(admin.errors[:is_main_administer]).to include("is not included in the list")
      end

      it 'is invalid without an is_deleted' do
        admin = FactoryBot.build(:admin, is_deleted: nil)
        admin.valid?
        expect(admin.errors[:is_deleted]).to include("is not included in the list")
      end
    end

    context 'when values are duplicated' do
      it 'is invalid with a duplicate email' do
        FactoryBot.create(:admin, email: 'test@wcp.com')
        admin = FactoryBot.build(:admin, email: 'test@wcp.com')
        admin.valid?
        expect(admin.errors[:email]).to include('has already been taken')
      end
    end

    context 'when the value is limited' do
      it 'is invalid password with 5 or fewer characters' do
        admin = FactoryBot.build(:admin, password: '12345')
        admin.valid?
        expect(admin.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'is invalid password with 21 or more characters' do
        num = '12345' * 5
        admin = FactoryBot.build(:admin, password: num)
        admin.valid?
        expect(admin.errors[:password]).to include('is too long (maximum is 20 characters)')
      end
    end
  end

end
