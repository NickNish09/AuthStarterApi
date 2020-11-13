require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "POST /posts" do
    before(:each) do
      @params = {
          "post": {
              "title": "Título legal",
              "description": "Descrição interessante",
              "subtitle": "Subtítulo legal",
              "published_at": "12-12-2012"
          }
      }
      post "/v1/posts", as: :json, params: @params
    end

    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    # Testar json de retorno
    it 'returns the post data' do
      expect(JSON.parse(response.body)['title']).to eq("Título legal")
    end
    
  end
end
