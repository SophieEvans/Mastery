class AddGoodStyleToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :good_style, :boolean, default: false
  end
end
