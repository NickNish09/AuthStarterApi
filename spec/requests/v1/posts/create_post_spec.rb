require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "POST /posts" do
    before(:each) do
      @params = {
          "post": {
              "title": "Título legal",
              "description": "Descrição interessante"
          }
      }
    end

    it 'returns success status' do
      post "/v1/posts", as: :json, params: @params
      expect(response).to have_http_status(:success)
    end

    # Testar json de retorno
    
  end
end
