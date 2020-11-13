require 'rails_helper'

RSpec.describe "V1::AuthRequests", type: :request do
  describe "POST /v1/auth/sign_in" do
    before do
      @user = create(:user)
    end
    
    context 'when user exists' do
      before do
        post user_session_path, params: {email: @user.email, password: @user.password}
      end

      it "returns http status 200" do
        expect(response).to have_http_status(200)
      end
  
      it 'returns the user data' do
        expect(JSON.parse(response.body)['data']['name']).to eq @user.name
      end
      
      it 'returns the user token' do
        expect(headers['access-token']).to_not be_nil
      end
    end

    context 'when user does not exist' do
      before do
        post user_session_path, params: {email: "user@notexistent.com", password: "123456"}
      end

      it 'returns http status unauthorized' do
        expect(response).to have_http_status(401)
      end

      it 'returns an error message' do
        expect(JSON.parse(response.body)['errors']).to include(a_kind_of(String))
      end
    end
  end
end
