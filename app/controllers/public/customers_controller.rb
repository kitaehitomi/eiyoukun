class Public::CustomersController < ApplicationController
  def show
     @customer = current_customer
  end

  def edit
     @customer = current_customer
  end
  def update
     @customer = current_customer
     @customer.update(customer_params)
    # ↑これはどんな内容をアップデートするかを
     redirect_to  public_customers_show_path
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
    params.require(:customer).permit(:profile_image, :last_name, :first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number)
  end
end
