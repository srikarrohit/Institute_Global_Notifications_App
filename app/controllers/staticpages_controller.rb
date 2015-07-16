require 'json'
class StaticpagesController < ApplicationController
  def home
		@posts=Post.all
		file=File.read("public/users.json")
    data_hash = JSON.parse(file)
		data_hash.each do |data|
			if data["id"] == getid
				@notifs=data["notifids"]
			end
		end
		if logged_in?
			@usercat= Usercat.find_by(user_id: getid)
#		else
 #        redirect_to url_for(:controller=>'oauth',:action=>'index')
		end	
	end
end
