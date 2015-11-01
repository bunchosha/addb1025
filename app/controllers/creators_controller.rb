class CreatorsController < ApplicationController
	def new
		@creator  = Creator.new
	end

	def create


		@creator = Creator.new(creator_params)
		if @creator.save
			flash[:success] = "new Creator"
			redirect_to @creator
		else
			render "new"
		end
	end

	def show
		@creator = Creator.find(params[:id])
	end

	def index
		@creators = Creator.all
	end


	private
		def creator_params
			params.require(:creator).permit(:name,:roma, :agency, :job_id)
		end


end

