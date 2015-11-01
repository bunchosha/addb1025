class JobsController < ApplicationController

  def new
  	@job  = Job.new
  end

  def create
  	@job = Job.new(job_params)
  	if @job.save
  		flash[:success] = "new job"
  		redirect_to jobs_path
  	else
  		render "new"
  	end
  end

  def show
  	@job = Job.find(params[:id])
  end

  def index
  	@jobs = Job.all
  end


  private 
  	def job_params
  		params.require(:job).permit(:name, :short)
  	end


end
