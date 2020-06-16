class AddCompletedToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :completed, :boolean, null: false, default: false
  end
end
