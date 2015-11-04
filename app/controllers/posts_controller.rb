class PostsController < ApplicationController
  autocomplete :company, :name, :full => true

  def new
    @post = Post.new
    @categories = Category.all
    @companies = Company.all
  end

  def create
    @post = Post.new(post_params)
    company_id = Company.find_by(:name => params[:post][:company_name]).id
    
    if (company_id)
      @post.company_id = company_id
      logger.debug "あいうおえ"
      logger.debug company_id
      logger.debug @post.company_id

      if @post.save
        flash[:success] = "New Post!"
        redirect_to edit_post_path(@post)
      else
        render "new"
      end
    else
      flash[:false] = "NO COMPANY"
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

  def addpicture
    @post = Post.find(params[:id])
  end

  def addcreator
    @post = Post.find(params[:id])

  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post destroyed."
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])

    if(params[:post][:job_id] && params[:post][:creator_id])
      cid = params[:post][:creator_id]
      jobname = Job.find(params[:post][:job_id]).name
      @assign = Assign.create(creator_id: cid, post_id: @post.id, job: jobname)
      
      flash[:success] = "ADD USER " + Creator.find(cid).name
      redirect_to request.referrer || root_url

    else

    if @post.category_id == "1" then
      @post.youtube = params[:post][:youtube]
      @post.youtube_id = @post.youtube.split("v=")[-1]
      @post.pic = "http://img.youtube.com/vi/"+ @post.youtube_id+ "/0.jpg"
    end

    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
   end
  end

  private
    def post_params
      params.require(:post).permit(:title, :category_id, :company_id, :cotent, :pdate, :pic, :youtube, :product_id, :youtube_id, :creator_id, :message)
    end
end
