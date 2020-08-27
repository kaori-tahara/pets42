class JobnegotiationsController < ApplicationController
    before_action :authenticate_user!
    before_action :forbitten
  
    def index
      @job = Job.find(params[:job_id])
    end
  
    def create
      @jobnegotiation = Jobnegotiation.new
      if @jobnegotiation.save
        redirect_to jobs_path
      else
        render :index
      end
    end
  
  
    def forbitten
      @job = Job.find(params[:job_id])
      redirect_to jobs_path if @job.user_id == current_user.id
      redirect_to jobs_path if @job.job_history.present?
    end

  


end
