class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def edit
	end

	def destroy
	end

	def new
		@topic = Topic.new
		@post = Post.new
	end

	def create
	  @topic = Topic.new(params.require(:topic).permit(:title, :section_id, :user_id))
	  if @topic.save
		params[:post][:topic_id] = @topic.id, 
		params[:post][:user_id] = current_user.id
		@post = Post.new(params.require(:post).permit(:text, :topic_id, :user_id))
	    if @post.save
	      flash[:notice] = "Successfully created topic."
	      redirect_to "/forums/#{@topic.forum_id}"
	    else
	      redirect_to :action => 'new'
	    end
	  else
	    render :action => 'new'
	  end
	end
end