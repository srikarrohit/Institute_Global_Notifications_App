class StaticpagesController < ApplicationController
  def home
		@posts=Post.all
		@notifs= Notification.all
		if logged_in?
			@usercat= Usercat.find_by(user_id: getid)
#		else
 #        redirect_to url_for(:controller=>'oauth',:action=>'index')
		end	
	end
end
