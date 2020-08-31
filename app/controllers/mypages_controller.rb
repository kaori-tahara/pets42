class MypagesController < ApplicationController
  # before_action :not_user, except: [:show]


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
     @nickname = user.nickname
     @mypage = user.mypage
     @craving_history = CravingHistory.where("user = #{user}").order('created_at DESC')
     @job_history = JobHistory.where("user = #{user}").order('created_at DESC')
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

  # def not_user
  #   unless @user == current_user
  #     redirect_to root_path
  #   end
  # end
  
end
