class Public::PostsController < ApplicationController
  def new
     @post_image = Post.new
  end

  def create # 投稿データの保存
    @post_image = Post.new(post_params)
    @post_image.customer_id = current_customer.id
    @post_image.save
    redirect_to public_posts_path
  end

  def index
    @post = Post.new
    @post_comment = PostComment.new
    if params[:keyword].present?
      @posts = Post.where('caption LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
    @posts = @posts.page(params[:page]).per(9)

  end

  def show
    @post_comment = PostComment.new
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])  # データ（レコード）を1件取得

    # 悪意あるユーザーの対策すらならこのような感じ
    # redirect_to root_path if @post.customer_id != current_customer.id

    @post.destroy  # データ（レコード）を削除
    redirect_to public_posts_path# 投稿一覧画面へリダイレクト
  end
    # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :caption, :image)
  end
end
