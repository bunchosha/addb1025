class AssignsController < ApplicationController
  def new
  end

  def destroy
  	@assign = Assign.find(params[:id])
  	@assign.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
end
