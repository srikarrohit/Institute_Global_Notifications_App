class StaticpagesController < ApplicationController
  def home
		@notifs= Notification.all
		if logged_in?
			@usercat= Usercat.find_by(user_id: getid)
#		else
 #        redirect_to url_for(:controller=>'oauth',:action=>'index')
		end
			

		
	
	end
end
