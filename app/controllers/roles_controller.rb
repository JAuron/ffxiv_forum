class RolesController < ApplicationController

	def index
		@roles = Role.all
	end

	def edit
		@role = Role.find(params[:id])
	end

	def update
    @role = Role.find(params[:id])
    if @role.update(role_params)
      redirect_to "/roles"
    else
      render :action => :edit
    end
  end

	def destroy
		@role = Role.find(params[:id])
    @role.destroy
    redirect_to "/roles"
	end

	def new
		@role = Role.new
	end

	def create
 		@role = Role.new(role_params)
    if @role.save
      flash[:notice] = "Successfully created role."
      redirect_to "/topics/#{@role.topic_id}"
    else
      redirect_back(fallback_location: '/')
    end
	end

	private

	def role_params
		params.require(:role).permit(:name, :classification, :icon_url)
	end

end