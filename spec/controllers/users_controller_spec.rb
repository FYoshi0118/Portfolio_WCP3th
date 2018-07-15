require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#show" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
        get :show, params: {id: @user.id}
      end

      it "responds successfully" do
        expect(response).to be_success
      end
      it "returns a 200 response" do
        expect(response).to have_http_status "200"
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
      it "is valid correct values in @user" do
        expect(assigns(:user)).to eq @user
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        sign_in @user
        get :show, params: {id: other_user.id}
      end

      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end
      it "redirect to the top page" do
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        get :show, params: {id: 1}
      end
      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end
      it "redirect to the top page" do
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#edit" do
    context "as am authorized user" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
        get :edit, params: {id: @user.id}
      end

      it "responds successfully" do
        expect(response).to be_success
      end
      it "returns a 200 response" do
        expect(response).to have_http_status "200"
      end
      it "renders the :show template" do
        expect(response).to render_template :edit
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        sign_in @user
        get :edit, params: {id: other_user.id}
      end

      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end
      it "redirect to the top page" do
        expect(response).to redirect_to root_path
      end
    end

    context "as a geust" do
      before do
        get :edit, params: {id: 1}
      end
      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end
      it "redirect to the top page" do
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @user_params = FactoryBot.attributes_for(:user, nickname: "更新1",
                                                      name_code: "@update1",
                                                      birthday: "2018/07",
                                                      email: "update1@wcp.com",
                                                      introduction: "update test1"
        )
        sign_in @user
      end

      it "update a user" do
        patch :update, params: {id: @user.id, user: @user_params}
        @user.reload
        expect(@user.nickname).to eq "更新1"
        expect(@user.name_code).to eq "@update1"
        expect(@user.birthday).to eq "2018/07"
        expect(@user.email).to eq "update1@wcp.com"
        expect(@user.introduction).to eq "update test1"
      end
      it "redirect to the show page" do
        patch :update, params: {id: @user.id, user: @user_params}
        expect(response).to redirect_to user_path(@user)
      end
      it "flash[:notice]にメッセージが含まれる" do
        patch :update, params: {id: @user.id, user: @user_params}
        expect(flash[:notice]).to eq "更新しました"
      end
    end
  end

  describe "#confirm" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
        get :confirm, params: {id: @user.id}
      end

      it "responds successfully" do
        expect(response).to be_success
      end
      it "returns a 200 response" do
        expect(response).to have_http_status "200"
      end
      it "renders the :show template" do
        expect(response).to render_template :confirm
      end
      it "is valid correct values in @user" do
        expect(assigns(:user)).to eq @user
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        sign_in @user
        get :confirm, params: {id: other_user.id}
      end

      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end
      it "redirect to the top page" do
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        get :confirm, params: {id: 1}
      end

      it "returns a 302 response" do
        expect(response).to have_http_status "302"
      end
      it "redirect to the top page" do
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe "#unsubscribe" do
    context "as authorized user"
    context "as an unauthorized user"
    context "as a guest"
  end
end
