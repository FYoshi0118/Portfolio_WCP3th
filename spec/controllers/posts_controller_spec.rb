require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
        get :index
      end

      it "responds successfully" do
        expect(response).to be_success
      end
      it "returns a 200 response" do
        expect(response).to have_http_status "200"
      end
      it "renders the :top template" do
        expect(response).to render_template :show
      end
    end

    context "as a guest" do
      before do
        get :index
      end

      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end
      it "redirect to the sign-in page" do
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#show" do
    context "as an authorized user"do
      before do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post, user: @user)
      end

      it "respond successfully" do
        sign_in @user
        get :show, params: { id: @post.id }
        expect(response).to be_success
      end
    end

    context "as an unauthorized user"do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post, user: other_user)
      end

      it "redirect to the top page" do
        sign_in @user
        get :show, params: { id: @post.id }
        expect(@post).to redirect_to root_path
      end
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "add a post" do
        post_params = FactoryBot.attributes_for(:post)
        binding.pry
        sign_in @user
        expect {
          post :create, params: { post: post_params }
        }.to change(@user.posts, :count).by(1)
      end
    end
  end

end
