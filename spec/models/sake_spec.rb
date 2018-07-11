require 'rails_helper'

RSpec.describe Sake, type: :model do
  # before do
  #   Sake.create(
  #     brewery_id: 1,
  #     brand: '獺祭',
  #     specially_designated: '純米酒',
  #     recipe: "無濾過生原酒",
  #     flavor: "薫酒",
  #     nihonshudo: -2,
  #     acidity: -2
  #   )
  # end

  describe '正常系のテスト'do
    it 'brandがあれば有効な状態であること' do
      sake = Sake.new(
        brewery_id: 1,
        brand: '獺祭'
      )
      expect(sake).to be_valid
    end
    
  #   it 'user_id、sake_id、star、content、imageがあれば有効な状態であること' do
  #     post = Post.new(
  #       user_id: 1,
  #       sake_id: 1,
  #       content: 'この内容はテスト',
  #       image_id: 1234
  #     )
  #     expect(post).to be_valid
  #   end

    it 'is_confirmedがデフォルトでfalseであること' do
      sake = Sake.new()
      expect(sake.is_confirmed).to eq false
    end
  end

  describe '異常系のテスト' do
    context '値が空の場合' do
  #     it 'user_idがなければ無効な状態であること' do
  #       post = Post.new(user_id: nil)
  #       post.valid?
  #       expect(post.errors[:user_id]).to include("can't be blank")
  #     end
  
  #     it 'sake_idがなければ無効な状態であること' do
  #       post = Post.new(sake_id: nil)
  #       post.valid?
  #       expect(post.errors[:sake_id]).to include("can't be blank")
  #     end
  
  #     it 'contentがなければ無効な状態であること' do
  #       post = Post.new(content: nil)
  #       post.valid?
  #       expect(post.errors[:content]).to include("can't be blank")
  #     end
  
  #     it 'starがなければ無効な状態であること' do
  #       post = Post.new(star: nil)
  #       post.valid?
  #       expect(post.errors[:star]).to include("can't be blank")
  #     end
    end

    context '入力制限の場合' do
  #     it 'contentが201文字以上であれば無効な状態であること' do
  #       str = "これは１０文字でーす" * 21
  #       post = Post.new(content: str)
  #       post.valid?
  #       expect(post.errors[:content]).to include('is too long (maximum is 200 characters)')
  #     end
    end
  end
end
