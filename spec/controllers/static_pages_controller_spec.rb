require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "ルーティング確認" do
    it "static_pages#top succsess" do
      get :top
      expect(response).to have_http_status(:success)
    end
    
    it "static_pages#about succsess" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
