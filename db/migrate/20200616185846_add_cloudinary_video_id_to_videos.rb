class AddCloudinaryVideoIdToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :cloudinary_video_id, :string
  end
end
