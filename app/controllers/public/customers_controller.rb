class Public::CustomersController < ApplicationController
  def show
     @customer = current_customer
     @posts = Post.all
    @bookmarks = @customer.bookmarks
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorites = Post.where(id: favorites)
  end
  def mypage
  @bookmarks = Bookmark.where(customer_id: current_customer.id)
  end

  def edit
     @customer = current_customer
  end
  def update
     @customer = current_customer
     @customer.update(customer_params)
    # ↑これはどんな内容をアップデートするかを
     redirect_to  public_customer_path(@customer)
  end

  def confirmation
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to  root_path

  end


 private

  def customer_params
    params.require(:customer).permit(:height, :weight, :profile_image, :last_name, :first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number)
  end
end

