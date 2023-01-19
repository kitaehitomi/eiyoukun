class PostImage < ApplicationRecord
    has_many :post_comments, dependent: :destroy
    belongs_to :customer
    has_many :favorites, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
  
  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end
end
