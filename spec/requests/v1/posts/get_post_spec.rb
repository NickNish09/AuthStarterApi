require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "GET /posts/:id" do
    before(:each) do
      @post = create(:post)
    end

    it 'returns success status' do
      get "/v1/posts/#{@post.id}", as: :json
      expect(response).to have_http_status(:success)
    end

    it 'returns the post' do
      get "/v1/posts/#{@post.id}", as: :json
      expect(response.body).to eq(@post.to_json)
    end

    it 'get nonexistent post' do
      get "/v1/posts/#{SecureRandom.hex}", as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
