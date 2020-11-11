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

    context 'model validations' do

      it 'is valid with valid attributes' do
        user = build(:user)
        expect(user).to be_valid
      end

      it 'is not valid without a name' do
        user = build(:user, name: nil)
        expect(user).to_not be_valid
      end

      it 'is not valid without a email' do
        user = build(:user, email: nil)
        expect(user).to_not be_valid
      end

      it 'is not valid without a password' do
        user = build(:user, password: nil)
        expect(user).to_not be_valid
      end

      it 'is not valid without a nickname' do
        user = build(:user, nickname: nil)
        expect(user).to_not be_valid
      end
    end
  end
end