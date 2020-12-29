require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "DELETE /posts/:id" do
    context 'when user deletes his own post' do
      before(:each) do
        @post = create(:post)
        headers = @post.user.create_new_auth_token
        delete "/v1/posts/#{@post.id}", headers: headers, as: :json
      end
  
      it 'returns success status' do
        expect(response).to have_http_status(:success)
      end
  
      it 'deletes the post' do
        expect(Post.find_by(id: @post.id)).to eq(nil)
      end
    end

    context 'when user tries to delete other person post' do
      before(:each) do
        @post = create(:post)
        headers = create(:user).create_new_auth_token
        delete "/v1/posts/#{@post.id}", headers: headers, as: :json
      end
  
      it 'returns success forbidden' do
        expect(response).to have_http_status(401)
      end
  
      it 'does not deletes the post' do
        expect(Post.find_by(id: @post.id)).to_not eq(nil)
      end
    end
  end
end
