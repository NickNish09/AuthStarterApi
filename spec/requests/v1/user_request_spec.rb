require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  describe "GET #current_user_data" do
    context "when user is not authenticated" do
      before do
        get current_user_data_path
      end

      it 'should return an error message' do
        expect(JSON.parse(response.body)['error']).to eq "você precisa estar autenticado ter acesso"
      end
    end
  end
end
