class AddingStyleToVideo < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :style, :integer
  end
end
