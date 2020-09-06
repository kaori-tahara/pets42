class MypagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @mypage = Mypage.new
  end

  def create
    @mypage = Mypage.new(mypage_params)
    if @mypage.save
      redirect_to pets_path
    else
      redirect_to new_mypage_path
    end
  end

  def show
    user = User.find(params[:id])
    @mypage = user.mypage
    @craving_histories = CravingHistory.includes(:user).order('created_at DESC')
    @job_histories = JobHistory.includes(:user).order('created_at DESC')
  end

  def edit
    @mypage = Mypage.find(params[:id])
  end

  def update
    @mypage = Mypage.find(params[:id])
    if @mypage.update(mypage_params)
      redirect_to pets_path
    else
      render :edit
    end
  end

  private

  def mypage_params
    params.require(:mypage).permit(:dog_love_id, :text, :mypage_picture).merge(user_id: current_user.id)
  end
end
