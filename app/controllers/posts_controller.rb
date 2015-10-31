class PostsController < ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
    @companies = Company.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "New Post!"
      redirect_to @post
    else
      render "new"
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post destroyed."
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :category_id, :company_id, :cotent, :date, :pic, :youtube, :product_id)
    end
end
