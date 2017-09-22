class UsersController < ApplicationController

  def new
  end

  def create
    if session[:user_id].present?
    	redirect_to '/'
    end
	  @user = User.new(user_params)
	  create_lodestone(@user.lodestone_id)
	  if @user.save
	  	assign_roles(params[:user][:roles], @user.id)
	    session[:user_id] = @user.id
	    redirect_to '/'
	  else
	    redirect_to '/signup'
	  end
	end

  def show
    @user = User.find(params[:id])
    @lodestone_data = @user.lodestone
  end
 
  private

	def user_params
	  params.require(:user).permit(:lodestone_id, :email, :password, :password_confirmation)
	end

	def create_lodestone(lodestone_id)
  	url = "https://api.xivdb.com/character/#{lodestone_id}"
  	resp = Net::HTTP.get_response(URI.parse(url))
  	return false if resp.code == "404"
  	data = JSON.parse(resp.body)
  	Lodestone.new(
  		id: lodestone_id,
  		name: data["name"],
  		title: data["data"]["title"],
  		server: data["server"],
  		free_company: nil,
  		portrait: data["portrait"],
  		avatar: data["avatar"],
  		class_data: data["data"]["classjobs"]
  	).save!
  end

  def assign_roles(roles_array, user_id)
  	roles_array.each do |role_id|
  		UserRoleAssignment.new(user_id: user_id, role_id: role_id).save!
  	end
  end

  def user_class_data(classdata)
    compressed_data = []
    classdata.each do |class_data|
      data = {c_name: class_data.last["name"], level: class_data.last["level"]}
      compressed_data << data
    end
    return compressed_data
  end 

  def class_data_cleaner
  end

end