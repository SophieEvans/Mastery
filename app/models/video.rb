class Video < ApplicationRecord
  belongs_to :user
  belongs_to :sub_category
  has_many :interactions, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:title, :you_tube_key],
    associated_against: {
      sub_category: [:name, :difficulty]
        },
    using: {
      tsearch: { prefix: true }
    }
end
