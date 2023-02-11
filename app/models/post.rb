class Post < ApplicationRecord
  belongs_to :customer
  has_many :post_comments
  has_many :favorites
  has_many :bookmarks
  def bookmarked_by?(customer)
    bookmarks.where(customer:customer).exists?
  end
  def favorited_by?(customer)
    favorites.where(customer:customer).exists?
  end
end
