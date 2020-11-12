require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "PUT /posts/:id" do
    before(:each) do
      @post = create(:post)
      @params = {
          "post": {
              "title": "Novo título legal",
              "description": "Nova descrição interessante"
          }
      }
    end

    it 'returns success status' do
      patch "/v1/posts/#{@post.id}", as: :json, params: @params
      expect(response).to have_http_status(:success)
    end
  end
end
