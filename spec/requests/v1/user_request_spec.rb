require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  let(:valid_headers) {
    @user = create(:user)
    @user.create_new_auth_token
  }

  describe "GET /current_user_data" do
    context "when user is not authenticated" do
      before do
        get current_user_data_path
      end

      it 'should return an error message' do
        expect(JSON.parse(response.body)['error']).to eq "você precisa estar autenticado ter acesso"
      end
    end

    context "when user is authenticated" do
      before do
        headers = valid_headers
        get current_user_data_path, params: {}, headers: headers
      end

      it 'returns status code success' do
        expect(response).to have_http_status(:success)
      end

      it 'should return the user profile data' do
        expect(JSON.parse(response.body)['name']).to eq @user.name
        expect(JSON.parse(response.body)['nickname']).to eq @user.nickname
        expect(JSON.parse(response.body)['email']).to eq @user.email
      end
    end
  end
end
