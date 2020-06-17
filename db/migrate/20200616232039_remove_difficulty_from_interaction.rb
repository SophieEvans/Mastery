class RemoveDifficultyFromInteraction < ActiveRecord::Migration[6.0]
  def change
    remove_column :interactions, :difficulty
  end
end
