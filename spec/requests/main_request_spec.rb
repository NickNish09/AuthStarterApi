require 'rails_helper'

RSpec.describe "MainController", type: :request do

  describe "GET Root" do
    before do
      get root_path
    end
    it "should return success status" do
      expect(response).to have_http_status(:success)
    end

    it 'should return the api version' do
      expect(JSON.parse(response.body)['api_version']).to eq "1.0"
    end
  end

end
