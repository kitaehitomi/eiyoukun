class Public::FavoritesController < ApplicationController
  def create
    #byebug
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_customer.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to public_post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_customer.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to public_post_image_path(post_image)
  end
end
