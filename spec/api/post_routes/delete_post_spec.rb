require 'rails_helper'

describe "delete post route", :type => :request do

  before(:each) do
    @post = create(:post)
  end

  it 'delete post' do
    delete "/v1/posts/#{@post.id}", as: :json
    expect(response).to have_http_status(:success)
    expect(Post.find_by(id: @post.id)).to eq(nil)
  end
end
