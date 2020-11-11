require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'model validations' do

    it 'is valid with valid attributes' do
      post = build(:post)
      expect(post).to be_valid
    end

    it 'is not valid without a title' do
      post = build(:post, title: nil)
      expect(post).to_not be_valid
    end

    it 'is not valid without a description' do
      post = build(:post, description: nil)
      expect(post).to_not be_valid
    end
  end
end