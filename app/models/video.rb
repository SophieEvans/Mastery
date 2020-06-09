class Video < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :interactions, dependent: :destroy
end
