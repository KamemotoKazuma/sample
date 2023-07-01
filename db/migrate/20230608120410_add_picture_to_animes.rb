class AddPictureToAnimes < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :picture, :string
  end
end
