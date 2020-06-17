class AddingCompleteRatingToVideoModel < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :totalrating, :integer
  end
end
