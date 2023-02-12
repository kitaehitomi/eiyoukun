class Admin::SportsController < ApplicationController
  def index
    @sports = Sport.new
    # 右側（モデルの名前を書くとき）は大文字スタートの単数系という決まり
    @sports = Sport.all
  end
  
   def create
    @sports = Sport.new(sports_params)
    if @sports.save
      redirect_to homes_top_path,notice: "送信されました"
    else
       @sports = sports.all
      render :index
    end
   end
  def destroy
    sport = Sport.find(params[:id])  # データ（レコード）を1件取得
    sport.destroy  # データ（レコード）を削除
    redirect_to '/homes/top'  # 投稿一覧画面へリダイレクト
  end
   
      private
    # ストロングパラメータ
    def sports_params
      params.require(:sport).permit(:name, :kcal)
    end
  
end
