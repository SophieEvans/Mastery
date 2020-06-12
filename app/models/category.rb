class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  has_many :videos, through: :sub_categories
end
