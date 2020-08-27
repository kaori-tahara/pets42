class CravingnegotiationsController < ApplicationController
    before_action :authenticate_user!
    before_action :forbittener
  
    def index
      @craving = Craving.find(params[:craving_id])
    end
  
    def create
      @cravingnegotiation =Cravingnegotiation.new
      if @cravingnegotiation.save
        redirect_to cravings_path
      else
        render :index
      end
    end
  
  
    def forbittener
      @craving = Craving.find(params[:craving_id])
      redirect_to cravings_path if @craving.user_id == current_user.id
      redirect_to cravings_path if @craving.craving_history.present?
    end

  
end
