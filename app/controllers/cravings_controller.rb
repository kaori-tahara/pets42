class CravingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_craving, only: [:show, :edit, :destroy, :update]

  def index
    @cravings = Craving.page(params[:page]).includes(:user).order('created_at DESC')
  end

  def new
    @craving = Craving.new
  end

  def create
    @craving = Craving.new(craving_params)
    if @craving.save
      redirect_to cravings_path
    else
      render :new
    end
  end

  def update
    if @craving.update(craving_params)
      redirect_to cravings_path
    else
      render :edit
    end
  end

  def destroy
    if @craving.destroy
      redirect_to cravings_path
    else
      render :show
    end
  end


  private

  def craving_params
    params.require(:craving).permit(:craving_picture, :title, :text, :experience_id, :working_date, :working_hour_id, :working_time_id).merge(user_id: current_user.id)
  end

  def set_craving
    @craving = Craving.find(params[:id])
  end

end
