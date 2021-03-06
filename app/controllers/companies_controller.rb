class CompaniesController < ApplicationController
 autocomplete :company, :name

  def new
  	@company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "New company"
      redirect_to @company
    else
      render 'new'
    end
  end


  def show
  	@company = Company.find(params[:id])
    @product = @company.products.build
  end

  def index
  	@companies = Company.all
  end

  private 
  	def company_params
  		params.require(:company).permit(:name, :url)
  	end
end
