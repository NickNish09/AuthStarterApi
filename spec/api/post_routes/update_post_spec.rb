require 'rails_helper'

describe "update post route", :type => :request do

  before(:each) do
    @post = create(:post)
    @params = {
      "post": {
        "title": "Novo título legal",
        "description": "Nova descrição interessante"
      }
    }
  end

  it 'patch post' do
    patch "/v1/posts/#{@post.id}", as: :json, params: @params
    expect(response).to have_http_status(:success)
  end
end
