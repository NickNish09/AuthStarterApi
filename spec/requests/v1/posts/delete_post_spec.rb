require 'rails_helper'

describe "V1::Posts", :type => :request do

  describe "DELETE /posts/:id" do
    before(:each) do
      @post = create(:post)
      delete "/v1/posts/#{@post.id}", as: :json
    end

    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    it 'deletes the post' do
      expect(Post.find_by(id: @post.id)).to eq(nil)
    end
  end
end
