class SectionsController < ApplicationController

	# before_filter :authorize
	
	def index
		@sections = Section.where(parent_section_id: 0)
	end

	def show
		@section = Section.find(params[:id])
		@sections = Section.where(parent_section_id: @section.id)
		@topics = Topic.where(section_id: @section.id)
	end

	def edit
	end

	def destroy
	end

	def new
		@section = Section.new
	end

	def create
		@section = Section.new(params.require(:section).permit(:title, :parent_section_id))
	  if @section.save
	    flash[:notice] = "Successfully created section."
	    redirect_to "/forums/#{@section.parent_section_id}"
	  else
	    redirect_to :action => 'new'
	  end
	end
end