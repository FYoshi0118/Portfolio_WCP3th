require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "normal system teset"do
    it "has a valid factory" do
      expect(FactoryBot.build(:post)).to be_valid
    end
    
    it "has a valid factory( + image_id )" do
      post = FactoryBot.build(:post, image_id: "1234")
      expect(post).to be_valid
    end

    it "the default for star is 0" do
      post = FactoryBot.build(:post)
      expect(post.star).to eq 0
    end
  end

  describe "error system test" do
    context "when the value is empty" do
      it "is invalid without user_id" do
        post = FactoryBot.build(:post, user_id: nil)
        post.valid?
        expect(post.errors[:user_id]).to include("can't be blank")
      end
  
      it "is invalid without sake_id" do
        post = FactoryBot.build(:post, sake_id: nil)
        post.valid?
        expect(post.errors[:sake_id]).to include("can't be blank")
      end
  
      it "is invalid without content" do
        post = FactoryBot.build(:post, content: nil)
        post.valid?
        expect(post.errors[:content]).to include("can't be blank")
      end
  
      it "is invalid without star" do
        post = FactoryBot.build(:post, star: nil)
        post.valid?
        expect(post.errors[:star]).to include("can't be blank")
      end
    end

    context "when the value is limited" do
      it "is invalid with 201 or more characters" do
        post = FactoryBot.build(:post, content: Faker::Number.number(201))
        post.valid?
        expect(post.errors[:content]).to include("is too long (maximum is 200 characters)")
      end
    end
  end
end
