require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "PUT /posts/:id" do
    context 'when user updates his own post' do
      before(:each) do
        @post = create(:post)
        @params = {
            "post": {
                "title": "Novo título legal",
                "description": "Nova descrição interessante"
            }
        }
        headers = @post.user.create_new_auth_token
        patch "/v1/posts/#{@post.id}", as: :json, params: @params, headers: headers
      end
  
      it 'returns success status' do
        expect(response).to have_http_status(:success)
      end
  
      # Teste para verificar se foi atualizado o post
      it 'updates the post data' do
        expect(JSON.parse(response.body)['title']).to eq "Novo título legal"
      end
    end

    context 'when user tries to update others person post' do
      before(:each) do
        @post = create(:post, title: "Titulo Legal")
        @params = {
            "post": {
                "title": "Novo título legal",
                "description": "Nova descrição interessante"
            }
        }
        patch "/v1/posts/#{@post.id}", as: :json, params: @params
      end
  
      it 'returns success forbidden' do
        expect(response).to have_http_status(401)
      end
  
      # Teste para verificar se foi atualizado o post
      it 'does not update the post data' do
        expect(@post.title).to eq "Titulo Legal"
      end
    end
    
  end
end
