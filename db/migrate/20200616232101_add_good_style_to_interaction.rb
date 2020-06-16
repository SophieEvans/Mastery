class AddGoodStyleToInteraction < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :good_style, :integer
  end
end
