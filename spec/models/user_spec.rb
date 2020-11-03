require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#profile_data" do
    before do
      @user = create(:user)
    end

    it 'should return the user name, email and nickname' do
      expect(@user.profile_data[:name]).to eq @user.name
      expect(@user.profile_data[:nickname]).to eq @user.nickname
      expect(@user.profile_data[:email]).to eq @user.email
    end
  end
end
