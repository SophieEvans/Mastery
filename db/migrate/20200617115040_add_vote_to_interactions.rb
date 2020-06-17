class AddVoteToInteractions < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :vote, :boolean
  end
end
