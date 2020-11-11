require 'rails_helper'

describe "get all posts route", :type => :request do

  before(:each) do
    @posts = create_list(:post, 3)
  end

  it 'get all posts' do
    get "/v1/posts", as: :json
    expect(response).to have_http_status(:success)
    expect(response.body).to eq(@posts.to_json)
  end
end
