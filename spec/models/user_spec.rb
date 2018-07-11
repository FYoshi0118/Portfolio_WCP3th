require 'rails_helper'

RSpec.describe User, type: :model do
  describe '正常系のテスト'do
    it 'name_code、nickname、email、passwordがあれば有効な状態であること' do
      user = User.new(
        name_code:  '@test',
        nickname:   'テスト太郎',
        email:      'test@wcp.com',
        password:   'password',
      )
      expect(user).to be_valid
    end
    
    it 'statusはデフォルトが0であること' do
      user = User.new()
      user.valid?
      expect(user.status).to eq 0
    end
  end

  describe '異常系のテスト' do
    before do
      User.create(
        name_code:  '@tarou',
        nickname:   'テスト太郎',
        email:      'tarou@wcp.com',
        password:   'password',
        status:     0
      )
    end

    context '値が空の場合' do
      it 'name_codeがなければ無効な状態であること' do
        user = User.new(name_code: nil)
        user.valid?
        expect(user.errors[:name_code]).to include("can't be blank")
      end

      it 'nicknameがなければ無効な状態であること' do
        user = User.new(nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it 'emailがなければ無効な状態であること' do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
    end

    context '値が重複している場合' do
      it '重複したname_codeなら無効な状態であること' do
        user = User.new(
          name_code:  '@tarou',
          nickname:   'テスト次郎',
          email:      'jirou@wcp.com',
          password:   'password',
          status:     0
        )
        user.valid?
        expect(user.errors[:name_code]).to include('has already been taken')
      end

      it '重複したemailなら無効な状態であること' do
        user = User.new(
          name_code:  '@jirou',
          nickname:   'テスト次郎',
          email:      'tarou@wcp.com',
          password:   'password',
          status:     0
        )
        user.valid?
        expect(user.errors[:email]).to include('has already been taken')
      end
    end

    context '入力制限の確認' do
      it 'name_codeが21文字以上なら無効な状態であること'
      it 'name_codeが半角英数字と-_以外なら無効な状態であること'
      it 'passwordが5文字以下なら無効な状態であること'
      it 'passwordが21文字以上なら無効な状態であること'
      it 'introductionが201文字以上なら無効な状態であること'
    end
  end
end
