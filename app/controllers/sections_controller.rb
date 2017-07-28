class SectionsController < ApplicationController
	def index
		@sections = Section.where(parent_section_id: params[:section_id])
	end

	def show
		@section = Section.find(params[:id])
	end

	def edit
	end

	def destroy
	end

	def new
	end
end