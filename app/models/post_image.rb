class PostImage < ApplicationRecord
    has_many :post_comments, dependent: :destroy
    belongs_to :customer
end
