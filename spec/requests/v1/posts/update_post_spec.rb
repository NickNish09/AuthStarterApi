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
      patch "/v1/posts/#{@post.id}", as: :json, params: @params
    end

    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    # Teste para verificar se foi atualizado o post
    it 'updates the post data' do
      expect(JSON.parse(response.body)['title']).to eq "Novo título legal"
    end
    
  end
end
