class UsersController < ApplicationController

  after_action :verify_authorized

  def index
    authorize User
    @users = User.all
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update_roles
    @user = User.find(params[:id])
    authorize @user
    binding.pry
    UserRoleAssignment.where(user_id: @user.id).destroy_all
    params[:user][:roles].each do |role|
      UserRoleAssignment.deleted.where(user_id: @user.id, role_id: Role.find(role).id).first.restore
    end
      flash[:alert] = "User Roles Updated"
      redirect_to user_path(@user)
  end

  def update_password
    @user = current_user
    authorize @user
    if @user.authenticate(params[:user][:current_password])
      if @user.update(user_password_params)
        flash[:alert] = "Password Updated"
        redirect_to root_path
      else
        flash[:alert] = "Failed to save Data"
        redirect_to user_path(@user)
      end
    else
      flash[:alert] = "Password Did not authenticate"
      redirect_to "/users"
    end
  end

  # New method of identify lodestone, loads up an image and details that the user is linking the correct account
  # If yes, user.save
  # If no then user submits a better name and searches again OR submits the user id from lodestone
  def create
    if session[:user_id].present?
    	redirect_to '/'
    end
	  @user = User.new(user_params)
    authorize @user
	  create_lodestone(@user.lodestone_id)
	  if @user.save!
	    session[:user_id] = @user.id
	    redirect_to '/'
	  else
	    redirect_to '/signup'
	  end
	end

  def show
    @user = User.find(params[:id])
    authorize @user
    @lodestone_data = @user.lodestone
    @class_data = JSON.parse(@lodestone_data.class_data)
    @metadata = JSON.parse(@lodestone_data.metadata)
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to "/users"
  end
 
  private

	def user_params
	  params.require(:user).permit(:lodestone_id, :email, :current_password, :password, :password_confirmation, :roles)
	end

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_roles_params
    params.require(:user).permit(:roles)
  end

  def get_user_lodestone_data(name)
    url = "https://xivsync.com/character/search?server=Moogle&name=#{name}"
    resp = Net::HTTP.get_response(URI.parse(url))
    return false if resp.code == "404"
    data = JSON.parse(resp.body)
    render :partial=>"users/possible_characters", :layout => false, :data => data["data"]["results"]
  end

	def create_lodestone(lodestone_id)
    url = "https://api.xivdb.com/character/#{lodestone_id}"
  	resp = Net::HTTP.get_response(URI.parse(url))
  	return false if resp.code == "404"
  	data = JSON.parse(resp.body)
  	Lodestone.new(
  		id: data["lodestone_id"],
  		name: data["name"],
  		server: data["server"],
  		free_company: nil,
  		portrait: data["portrait"],
  		avatar: data["avatar"],
  		class_data: data["data"]["classjobs"],
      metadata: data["data"]
  	).save!
  end

  def user_class_data(classdata)
    compressed_data = []
    classdata.each do |class_data|
      data = {c_name: class_data.last["name"], level: class_data.last["level"]}
      compressed_data << data
    end
    return compressed_data
  end 


end