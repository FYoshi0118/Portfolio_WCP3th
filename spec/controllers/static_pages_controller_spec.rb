require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe '#top' do
    before do 
      get :top
    end
    
    it 'responds successfully' do
      expect(response).to be_success
    end
    
    it 'returns a 200 response' do
      expect(response).to have_http_status '200'
    end
  end

  describe '#about' do
    before do
      get :about
    end
    
    it "responds successfully" do
      get :about
      expect(response).to be_success
    end
    
    it 'returns a 200 response' do
      expect(response).to have_http_status '200'
    end
  end

end
