class ClassLookupsController < ApplicationController

	def index
		@lookups = ClassLookup.all
	end

	def edit
		@lookup = ClassLookup.find(params[:id])
	end

	def update
    @lookup = ClassLookup.find(params[:id])
    if @lookup.update(class_lookup_params)
      redirect_to "/class_lookups"
    else
      render :action => :edit
    end
  end

	def destroy
		@lookup = ClassLookup.find(params[:id])
    @lookup.destroy
    redirect_to "/class_lookups"
	end

	def new
		@lookup = ClassLookup.new
	end

	def create
 		@lookup = ClassLookup.new(class_lookup_params)
    if @lookup.save
      flash[:notice] = "Successfully created lookup."
      redirect_to "/topics/#{@lookup.topic_id}"
    else
      redirect_back(fallback_location: '/')
    end
	end

	private

	def class_lookup_params
		params.require(:class_lookup).permit(:name, :classification, :icon_url)
	end

end