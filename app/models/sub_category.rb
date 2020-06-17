class SubCategory < ApplicationRecord
  has_many :videos, dependent: :destroy
end
