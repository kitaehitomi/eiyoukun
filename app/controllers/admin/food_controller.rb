class Admin::FoodController < ApplicationController
  def index
    @foods = Food.new
    # 右側（モデルの名前を書くとき）は大文字スタートの単数系という決まり
    @foods = Food.all
  end
  
   def create
    @foods = Food.new(food_params)
    if @foods.save
      redirect_to homes_top_path,notice: "送信されました"
    else
       @foods = foods.all
      render :index
    end
   end
      private
    # ストロングパラメータ
    def food_params
      params.require(:food).permit(:name, :kcal)
    end
  
end

  
  
