class CalendarsController < ApplicationController
  def new
    @calendar = Calendar.new
  end

  def create
    Calendar.create(calendar_params)
    redirect_to   mypages_calendars_path
  end


    private

    def calendar_params
      params.require(:calendar).permit(:title, :content,:vlog_day).merge(user_id: current_user.id)
    end
end
