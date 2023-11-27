class Blog < ApplicationRecord
  search_fields [:title, :body, :subheader]

  validates :title, :body, presence: true
end
