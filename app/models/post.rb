class Post < ApplicationRecord
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_one_attached :image

  def bookmarked_by?(customer)
    bookmarks.where(customer:customer).exists?
  end
  def favorited_by?(customer)
    favorites.where(customer:customer).exists?
  end
end
