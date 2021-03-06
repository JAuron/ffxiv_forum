class SectionsController < ApplicationController

	after_action :verify_authorized
	
	def index
		authorize Section
		@sections = Section.where(parent_section_id: 0)
		@topics = Topic.where(section_id: 0)
	end

	def show
		if params[:id] == '0'
			redirect_to '/forum'
		end
		@section = Section.find(params[:id])
		authorize @section
		@sections = Section.where(parent_section_id: @section.id)
		@topics = Topic.where(section_id: @section.id)
	end

	def edit
		@section = Section.find(params[:id])
		authorize @section
	end

	def destroy
		@section = Section.find(params[:id])
		authorize @section
    @section.destroy
    redirect_to "/forum/#{@section.parent_section_id}"
	end

	def new
		@section = Section.new
		authorize @section
	end

	def create
		@section = Section.new(params.require(:section).permit(:title, :parent_section_id))
		authorize @section
	  if @section.save
	    flash[:notice] = "Successfully created section."
	    unless @section.parent_section_id == 0
	    	redirect_to "/forum/#{@section.parent_section_id}"
	    else
	    	redirect_to "/forum"
	    end
	  else
	    redirect_to :action => 'new'
	  end
	end
end