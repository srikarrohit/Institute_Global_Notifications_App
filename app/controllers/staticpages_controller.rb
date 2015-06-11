class StaticpagesController < ApplicationController
  def home
		@notifs= Notification.all
  end
end
