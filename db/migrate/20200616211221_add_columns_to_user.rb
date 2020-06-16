class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :status, :string
    add_column :users, :rookie_completed, :decimal
    add_column :users, :intermediate_completed, :decimal
    add_column :users, :pro_completed, :decimal
  end
end
