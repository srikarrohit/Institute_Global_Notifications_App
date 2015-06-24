class StaticpagesController < ApplicationController
  def home
		@notifs= Notification.all
		if logged_in?
			@usercat= Usercat.find_by(user_id: getid)
		end
		
	
	end
end
