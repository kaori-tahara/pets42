class CalendarsController < ApplicationController


  def new
    calendar = Calendar.new
  end

  def create
    calendar = Calendar.create(calendar_params)
    redirect_to mypage_calendars_path(@mypage.id)
  end


    private

    def calendar_params
      params.require(:calendar).permit(:title, :content,:vlog_day).merge(user_id: current_user.id)
    end
end
