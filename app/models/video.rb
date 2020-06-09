class Video < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category

  validates :drill, presence: { unless: :tutorial? }
  validates :tutorial, presence: { unless: :drill? }
end
