require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "GET /posts" do
    before(:each) do
      @posts = create_list(:post, 3)
      get "/v1/posts", as: :json
    end

    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the list of posts' do
      expect(response.body).to eq(@posts.to_json)
    end
  end
end
