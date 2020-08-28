class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

   def show
    @user = User.new(user_params)
    @address = Address.new(user_address_params)
   end

  def edit
    @user = User.new(user_params)
    @address = Address.new(user_address_params)
    if @user&&@address.save
      redirect_to root_path
      else
        render :show
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :first_kana, :family_kana, :email, :nickname, :birth, :password)
  end

  def user_address_params
    params.require(:address).permit(:zip, :prefecture, :city, :phone)
  end




end
