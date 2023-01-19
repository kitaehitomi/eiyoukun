class HomesController < ApplicationController
  def top
    @posts = PostImage.all
    @bookmarks = Bookmark.all
  end
  def mypage
  @bookmarks = Bookmark.where(customer_id: current_customer.id)
  end
end
