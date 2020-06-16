class RemoveColumnsFromVideo < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :rating, :string
    remove_column :videos, :difficulty, :string
    remove_column :videos, :style, :string
    remove_column :videos, :totalrating, :string
  end
end
