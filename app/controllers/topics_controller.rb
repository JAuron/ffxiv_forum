class TopicsController < ApplicationController

	after_action :verify_authorized

	def index
		authorize Topic
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
		authorize @topic
		@posts = Post.where(topic_id: params[:id]).order(created_at: :asc).paginate(page: params[:page])
	end

	def edit
		@topic = Topic.find(params[:id])
		authorize @topic
	end

	def update
    @topic = Topic.find(params[:id])
		authorize @topic
    if @topic.update(topic_params)
      redirect_to "/topics/#{@topic.id}"
    else
      render :action => :edit
    end
  end

	def destroy
		@topic = Topic.find(params[:id])
		authorize @topic
    @topic.destroy
    redirect_to "/forum/#{@topic.section_id}"
	end

	def new
		@topic = Topic.new
		authorize @topic
		@topic.posts.build
	end

	def create
	  @topic = Topic.new(topic_params)
		authorize @topic
	  if @topic.save!
		# params[:post][:topic_id] = @topic.id
		# params[:post][:user_id] = @topic.user_id
 	# 	@post = Post.new(params.require(:post).permit(:text, :topic_id, :user_id))
	 #    if @post.save
	      flash[:notice] = "Successfully created topic."
	      redirect_to "/forum/#{@topic.section_id}"
	    # else
	    #   redirect_to :action => 'new'
	    # end
	  else
	    render :action => 'new'
	    puts flash[:error]
	  end
	end

	private

	def topic_params
		params.require(:topic).permit(:title, :section_id, :user_id, posts_attributes: [:text, :user_id])
	end
end