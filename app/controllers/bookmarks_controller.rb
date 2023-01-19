class BookmarksController < ApplicationController
   before_action :authenticate_customer!

  def create
    @post = PostImage.find(params[:post_id])
    bookmark = @post.bookmarks.new(customer_id: current_customer.id)
  
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post = PostImage.find(params[:post_id])
    bookmark = @post.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
