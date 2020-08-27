class JobsController < ApplicationController
    # before_action :authenticate_user!, except: [:index, :show]
    before_action :set_job, only: [:show, :destroy, :update]
  
    def index
      @jobs = Job.includes(:user).order('created_at DESC')
    end

    def show
    end
  
    def new
      @job = Job.new
    end
  
    def create
      @job = Job.new(job_params)
      if @job.save
        redirect_to jobs_path
      else
        render :new
      end
    end
  
    # def update
    #   if @item.update(item_params)
    #     redirect_to root_path
    #   else
    #     render :edit
    #   end
    # end
  
    # def destroy
    #   if @item.destroy
    #     redirect_to root_path
    #   else
    #     render :show
    #   end
    # end
  
    private
  
    def job_params
      params.require(:job).permit(:title, :text, :dog_picture, :dog_name, :dog_bleed, :dog_age, :working_hour_id, :working_date, :prefecture_id, :city, :working_time_id).merge(user_id: current_user.id)
    end
  
    def set_job
      @job = Job.find(params[:id])
    end
  
end
