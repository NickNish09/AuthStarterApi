class Post < ApplicationRecord

  validates :title, :description, presence: true

  # Função para truncar descrição
  def truncate_desc(size)
    description.truncate(size)
  end

  # Função para formatar created_at DD/MM/AAAA
  def formated_created_at
    created_at.strftime("%d/%m/%Y")
  end

end
