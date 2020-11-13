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

  # Teste para funcao de truncar descricao
  describe '#truncate_desc' do
    before do
      @post = create(:post, description: "This is a post description")
    end

    it 'returns the post with the description truncated' do
      expect(@post.truncate_desc(5)).to eq "Th..."
    end
  end

  # Teste para funcao de formatar created_at
  describe '#formated_created_at' do
    before do
      @post = create(:post)
    end

    it 'returns the created_at formated as DD/MM/AAAA' do
      expect(@post.formated_created_at).to match(/^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$/)
    end
  end
end