class AddColumnToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :completed, :boolean
  end
end
