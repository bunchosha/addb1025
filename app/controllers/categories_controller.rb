class CategoriesController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :new]
   before_action :admin_user, only: [:new, :destroy]
  def new
  	@category  = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:success] = "new category"
  		redirect_to @category
  	else
  		render "new"
  	end
  end

  def show
  	@category = Category.find(params[:id])
  end

  def index
  	@categories = Category.all
  end


  private 
  	def category_params
  		params.require(:category).permit(:name)
  	end
  	 def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def admin_user
      redirect_to(root_path) unless current_user.id = 1
    end
end
