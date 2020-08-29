class UsersController < ApplicationController
  

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

   def show
    @show_mypage = User.find(params[:id]).merge(:address_id)
   end



  def edit
    @mypage = Mypage.new(mypage_params)
    if @mypage.save
      redirect_to root_path
      else
        render :show
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :first_kana, :family_kana, :email, :nickname, :birth, :password)
  end

  def mypage_params
    params.require(:mypage).permit(:first_name, :family_name, :first_kana, :family_kana, :email, :nickname, :birth,:zip,:prefecture,:city,:phone,:dog_love_id,:text,:mypage_picture)
  end



end
