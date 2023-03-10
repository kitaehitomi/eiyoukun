class Public::FavoritesController < ApplicationController
  def create
    #byebug
    post = Post.find(params[:post_image_id])
    favorite = current_customer.favorites.new(post_id: post.id)
    favorite.save
    redirect_to public_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_image_id])
    favorite = current_customer.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to public_post_path(post)
  end
end
