class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.boolean :viewed_on
      t.references :user, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true
      t.boolean :favourite
      t.boolean :viewed
      t.integer :difficulty
      t.integer :rating

      t.timestamps
    end
  end
end
