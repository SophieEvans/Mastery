class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.integer :helpful
      t.integer :good_style
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :sub_category, null: false, foreign_key: true
      t.string :you_tube_key
      t.string :title

      t.timestamps
    end
  end
end
