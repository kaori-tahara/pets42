class CalendarsController < ApplicationController
  

  def create
   calendar = Calendar.create(calendar_params)
    redirect_to "/mypages/#{calendar.mypage.id}"
  end


    private

    def calendar_params
      params.require(:calendar).permit(:title, :content,:vlog_day).merge(user_id: current_user.id,mypage_id: params[:mypage_id])
    end
end
