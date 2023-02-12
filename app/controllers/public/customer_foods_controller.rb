class Public::CustomerFoodsController < ApplicationController
  def new
    @new_customer_food = CustomerFood.new
    # 右側（モデルの名前を書くとき）は大文字スタートの単数系という決まり
    @foods = Food.all
    @customer_foods = CustomerFood.where(customer_id: current_customer.id)
  end

  def create
    @customer_food = CustomerFood.new(customer_food_params)
    if @customer_food.save
      redirect_to homes_top_path,notice: "送信されました"
    else
      @foods = Food.all
      render :new, notice: "送信できませんでした"
    end
  end

  def destroy
    customer_food = CustomerFood.find(params[:id])  # データ（レコード）を1件取得
    customer_food.destroy  # データ（レコード）を削除
    redirect_to '/homes/top'  # 投稿一覧画面へリダイレクト
  end

  def all_destroy
    CustomerFood.where(customer_id: current_customer.id).destroy_all
    redirect_to '/homes/top'  # 投稿一覧画面へリダイレクト
  end

      private
    # ストロングパラメータ
    def customer_food_params
      params.require(:customer_food).permit(:food_id, :customer_id)
    end

end

