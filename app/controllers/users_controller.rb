class UsersController < ApplicationController
  before_action :not_user, except: [:show]


  def new
    @mypage = Mypage.new
  end

  def create
     @mypage = Mypage.new(mypage_params)
     if @mypage.save
      redirect_to root_path
      else
        redirect_to user_path
      end
  end

   def show
    @mypage = Mypage.new
   end

  def edit
    @mypage = Mypage.new(mypage_params)
  end

  def update
    if @mypage.update(mypage_params)
      redirect_to root_path
      else
        redirect_to edit_user_path
      end
  end


  private


  def mypage_params
    params.require(:mypage).permit(:dog_love_id,:text,:mypage_picture).merge(user_id: current_user.id)
  end


  def not_user
    unless @user == current_user 
      redirect_to root_path
    end
  end


end
