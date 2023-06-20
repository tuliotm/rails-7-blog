class Post < ApplicationRecord
    include PgSearch
    extend FriendlyId

    validates :author, :body, :title, presence: true

    has_many :comments, dependent: :destroy

    friendly_id :title, use: :slugged

    pg_search_scope :search,
        against: %i[title body author],
        associated_against: { comments: %i[body] }
end
