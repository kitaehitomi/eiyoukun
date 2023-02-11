class Public::PostImagesController < ApplicationController
  def new
     @post_image = Post.new
  end
  
  def create # 投稿データの保存
    @post_image = Post.new(post_params)
    @post_image.customer_id = current_customer.id
    @post_image.save
    redirect_to public_post_images_path
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
  end

  def show
     @post_image = Post.find(params[:id])
     @post_images = Post.all
     @post_comment = PostComment.new
     
  end
  def destroy
    @post_image = PostImage.find(params[:id])  # データ（レコード）を1件取得
    @post_image.destroy  # データ（レコード）を削除
    redirect_to PostImage# 投稿一覧画面へリダイレクト  
  end
    # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :caption)
  end
end
