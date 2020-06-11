class ChangeColumnDificultyToString < ActiveRecord::Migration[6.0]
  def change
    change_column :interactions, :difficulty, :string
  end
end
