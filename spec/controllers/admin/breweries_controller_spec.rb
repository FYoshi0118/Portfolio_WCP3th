require 'rails_helper'

RSpec.describe Admin::BreweriesController, type: :controller do

  describe "GET #index" do
    context "as an authorized user" do
      before do
        @admin = FactoryBot.create(:admin)
        sign_in @admin
        get :index
      end
      it "responds successfully" do
        expect(response).to be_success
      end
      it "returns a 200 response" do
        expect(response).to have_http_status "200"
      end
      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
  end

  describe 'POST #create' do
    context "as an authorized admin" do
      before do
        @admin = FactoryBot.create(:admin)
        sign_in @admin
        get :new
      end
      it "saves the new contact in the database" do
        expect{
          post :create, brewery: FactoryBot.attributes_for(:brewery)
        }.to change(Brewery, :count).by(1)
      end
      it "redirects to brewery#index" do
        post :create, brewery: FactoryBot.attributes_for(:brewery)
        expect(response).to redirect_to admin_breweries_path
      end
    end
  end

end
