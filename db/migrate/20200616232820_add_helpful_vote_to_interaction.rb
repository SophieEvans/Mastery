class AddHelpfulVoteToInteraction < ActiveRecord::Migration[6.0]
  def change
    add_column :interactions, :helpful, :integer
  end
end
