class Public::PostImagesController < ApplicationController
  def new
     @post_image = PostImage.new
  end
  
  def create # 投稿データの保存
    @post_image = PostImage.new(post_image_params)
    @post_image.customer_id = current_customer.id
    @post_image.save
    redirect_to public_post_images_path
  end

  def index
    @post_image = PostImage.new
    @post_images = PostImage.all
    @post_comment = PostComment.new
  end

  def show
     @post_image = PostImage.find(params[:id])
     
  end
  def destroy
    @post_image = PostImage.find(params[:id])  # データ（レコード）を1件取得
    @post_image.destroy  # データ（レコード）を削除
    redirect_to PostImage# 投稿一覧画面へリダイレクト  
  end
    # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :caption)
  end
end
