class Video < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :categories, through: :sub_categories
  has_many :interactions, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :difficulty, :rating ],
    associated_against: {
      sub_category: [ :name]
        },
    using: {
      tsearch: { prefix: true }
    }
end
