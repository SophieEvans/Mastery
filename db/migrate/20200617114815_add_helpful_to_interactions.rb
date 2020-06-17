class AddHelpfulToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :helpful, :boolean, default: false
  end
end
