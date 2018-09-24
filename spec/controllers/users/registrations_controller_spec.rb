require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end
  
  describe "#new" do
    before do
      setup
      get :new
    end

    it "responds successfully" do
      expect(response).to be_success
    end
    it "returns a 200 response" do
      expect(response).to have_http_status("200")
    end
    it "renders the :new tmplate" do
      expect(response).to render_template :new
    end
  end

end
