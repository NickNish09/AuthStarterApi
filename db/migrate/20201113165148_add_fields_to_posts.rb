class AddFieldsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :published_at, :date
    add_column :posts, :subtitle, :string
  end
end
