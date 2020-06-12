class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :videos, dependent: :destroy

end
