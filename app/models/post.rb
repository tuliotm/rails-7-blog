class Post < ApplicationRecord
    validates :author, :body, :title, presence: true

    has_many :comments
end
