class Public::PostCommentsController < ApplicationController
  def create
    # binding.pry
    post = Post.find(params[:post_image_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to public_post_image_path(post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
