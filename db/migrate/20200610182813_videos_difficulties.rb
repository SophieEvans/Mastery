class VideosDifficulties < ActiveRecord::Migration[6.0]
  def change
    change_column :videos, :difficulty, :string
  end
end
