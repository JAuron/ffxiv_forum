class ArticlesController < ApplicationController

  after_action :verify_authorized
	
	def index
		authorize Article
		@articles = Article.all.paginate(page: params[:page])
	end

	def edit
		@article = Article.find(params[:id])
		authorize @article
	end

	def update
    @article = Article.find(params[:id])
		authorize @article
    if @article.update(article_params)
      redirect_to "/"
    else
      render :action => :edit
    end
  end

	def destroy
		@article = Article.find(params[:id])
		authorize @article
    @article.destroy
    redirect_to "/"
	end

	def new
		@article = Article.new
		authorize @article
	end

	def create
 		@article = Article.new(article_params)
		authorize @article
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to "/"
    else
      redirect_back(fallback_location: '/')
    end
	end

	private

	def article_params
		params.require(:article).permit(:text, :user_id)
	end

end