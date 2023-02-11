class Public::CustomerSportsController < ApplicationController
  def new
    @new_customer_sport = CustomerSport.new
    # 右側（モデルの名前を書くとき）は大文字スタートの単数系という決まり
    @sports = Sport.all
    @customer_sports = CustomerSport.all
  end

   def create
    @customer_sport = CustomerSport.new(customer_sport_params)
    if @customer_sport.save
      redirect_to homes_top_path,notice: "送信されました"
    else
      @sports = Sport.all
      render :new, notice: "送信できませんでした"
    end
   end
      private
    # ストロングパラメータ
    def customer_sport_params
      params.require(:customer_sport).permit(:sport_id, :customer_id)
    end

end
