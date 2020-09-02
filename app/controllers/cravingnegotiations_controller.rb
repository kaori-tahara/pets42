class CravingnegotiationsController < ApplicationController
  before_action :authenticate_user!
  before_action :forbittener

  def index
    @craving = Craving.find(params[:craving_id])
  end

  def create
    @craving_history = CravingHistory.new(craving_history_params)
    if @craving_history.save
      redirect_to cravings_path
    else
      render :index
    end
  end

  private

  def craving_history_params
    params.permit(:craving_id).merge(user_id: current_user.id)
  end

  def forbittener
    @craving = Craving.find(params[:craving_id])
    redirect_to cravings_path if @craving.user_id == current_user.id
    redirect_to cravings_path if @craving.craving_history.present?
  end
end
