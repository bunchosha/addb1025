class PicturesController < ApplicationController
	
	def new
		@pic = Picture.new
	end

	def create
		@post = Post.find(params[:post_id])
		@pic = @post.pictures.new(pic_params)

    	if @pic.save
        	flash[:success] = "New Picture!"
	        redirect_to edit_post_path(@post)
        else
          render "new"
        end
	end

	def edit
		@pic = Picture.find(params[:id])
	end

	def destroy
  		@pic = Picture.find(params[:id])
	  	@pic.destroy
	    flash[:success] = "Picture deleted"
	    redirect_to request.referrer || root_url

    end


	private
		def pic_params
			params.require(:picture).permit(:pic)
		end

end
