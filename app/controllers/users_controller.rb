class UsersController < ApplicationController

  def new
  end

  def create
    if session[:user_id].present?
    	redirect_to '/'
    end
	  user = User.new(user_params)
	  create_lodestone(user.lodestone_id)
	  binding.pry
	  if user.save
	    session[:user_id] = user.id
	    redirect_to '/'
	  else
	    redirect_to '/signup'
	  end
	end
 
  private

	def user_params
	  params.require(:user).permit(:lodestone_id, :email, :password, :password_confirmation)
	end

	 def create_lodestone(lodestone_id)
  	url = "https://api.xivdb.com/character/#{lodestone_id}"
  	resp = Net::HTTP.get_response(URI.parse(url))
  	data = JSON.parse(resp.body)
  	Lodestone.new(
  		id: lodestone_id,
  		name: data["name"],
  		title: data["title"],
  		server: data["server"],
  		free_company: nil,
  		portrait: nil,
  		avatar: nil,
  		active_class: nil
  		).save!
  end

end