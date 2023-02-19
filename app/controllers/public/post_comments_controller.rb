class Public::PostCommentsController < ApplicationController
  def create
    # binding.pry
    post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to public_post_path(post)
  end

  def destroy
    @post_comment = PostComment.find_by( params[:id])
    # データ（レコード）を1件取得
    # 悪意あるユーザーの対策すらならこのような感じ
    # redirect_to root_path if @post.customer_id != current_customer.id
    @post_comment.destroy  # データ（レコード）を削除
    redirect_to public_posts_path# 投稿一覧画面へリダイレクト
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
