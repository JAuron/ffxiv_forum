class PostsController < ApplicationController

	def edit
		@post = Post.find(params[:id])
	end

	def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to "/topics/#{@post.topic_id}"
    else
      render :action => :edit
    end
  end

	def destroy
		@post = Post.find(params[:id])
		authorize @post
    @post.destroy
    redirect_to "/topics/#{@post.topic_id}"
	end

	def new
		@post = Post.new
	end

	def create
 		@post = Post.new(post_params)
 		authorize @post
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to "/topics/#{@post.topic_id}"
    else
      redirect_back(fallback_location: '/')
    end
	end

	private

	def post_params
		params.require(:post).permit(:text, :topic_id, :user_id)
	end

end