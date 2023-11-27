class Blog < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_keyword, against: [:title, :body, :subheader]
  validates :title, :body, presence: true
end
