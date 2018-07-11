require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '正常系のテスト'do
    it 'family_name、given_name、email、passwordがあれば有効な状態であること' do
      admin = Admin.new(
        family_name:  'テスト',
        given_name:   '太郎',
        email:      'test@wcp.com',
        password:   'password'
      )
      expect(admin).to be_valid
    end
    
    it 'is_main_administerはデフォルトがfalseであること' do
      admin = Admin.new()
      admin.valid?
      expect(admin.is_main_administer).to eq false
    end
    
    it 'is_deletedはデフォルトがfalseであること' do
      admin = Admin.new()
      admin.valid?
      expect(admin.is_deleted).to eq false
    end
  end

  describe '異常系のテスト' do
    before do
      Admin.create(
        family_name:  'テスト',
        given_name:   '太郎',
        email:      'test@wcp.com',
        password:   'password'
      )
    end

    context '値が空の場合' do
      it 'family_nameがなければ無効な状態であること' do
        admin = Admin.new(family_name: nil)
        admin.valid?
        expect(admin.errors[:family_name]).to include("can't be blank")
      end

      it 'given_nameがなければ無効な状態であること' do
        admin = Admin.new(given_name: nil)
        admin.valid?
        expect(admin.errors[:given_name]).to include("can't be blank")
      end

      it 'emailがなければ無効な状態であること' do
        admin = Admin.new(email: nil)
        admin.valid?
        expect(admin.errors[:email]).to include("can't be blank")
      end
      
      it 'is_main_administerがなければ無効な状態であること' do
        admin = Admin.new(is_main_administer: nil)
        admin.valid?
        expect(admin.errors[:is_main_administer]).to include("is not included in the list")
      end
      
      it 'is_main_administerがなければ無効な状態であること' do
        admin = Admin.new(is_deleted: nil)
        admin.valid?
        expect(admin.errors[:is_deleted]).to include("is not included in the list")
      end
    end

    context '値が重複している場合' do
      it '重複したemailなら無効な状態であること' do
        admin = Admin.new(
          family_name:  'テスト',
          given_name:   '太郎',
          email:      'test@wcp.com',
          password:   'password'
        )
        admin.valid?
        expect(admin.errors[:email]).to include('has already been taken')
      end
    end

    context '入力制限の確認' do
      it 'passwordが5文字以下の場合' do
        admin = Admin.new(password: 12345)
        admin.valid?
        expect(admin.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'passwordが21文字以上の場合' do
        admin = Admin.new(password: 123451234512345123451)
        admin.valid?
        expect(admin.errors[:password]).to include('is too long (maximum is 20 characters)')
      end

      it 'is_deletedが「false」「true」以外なら無効な状態であること'
      it 'is_main_administerが「false」「true」以外なら無効な状態であること'
    end
  end
end
