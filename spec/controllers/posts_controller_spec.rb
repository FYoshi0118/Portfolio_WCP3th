require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'Get #index' do
    before do
      get :index
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
  end

  describe 'Get #new' do
    before do
      get :new
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
  end

end
