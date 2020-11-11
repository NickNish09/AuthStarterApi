require 'rails_helper'

describe "create new post route", :type => :request do

  before(:each) do
    @params = {
      "post": {
        "title": "Título legal",
        "description": "Descrição interessante"
      }
    }
  end

  it 'post new post' do
    post "/v1/posts", as: :json, params: @params
    expect(response).to have_http_status(:success)
  end
end
