class Post < ApplicationRecord

  validates :title, :description, presence: true

  # Função para truncar descrição
  
  # Função para formatar created_at DD/MM/AAAA

end
