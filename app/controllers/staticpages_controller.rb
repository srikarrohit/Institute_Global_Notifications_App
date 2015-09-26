require 'json'
class StaticpagesController < ApplicationController
  def home
		@posts=Post.all
		file=File.read("public/users.json")
    	data_hash = JSON.parse(file)
		students = data_hash["students"]
		students.each do |data|
			if data["id"] == getid
				@notifs=data["notifids"]
			end
		end
		if logged_in?
			@usercat= Usercat.find_by(user_id: getid)
		else
      redirect_to url_for(:controller=>'oauth',:action=>'index')
		end
	end
	@@data = File.read("public/users.json")
	def json
		render :json => @@data
	end
	def notif
		notifid = params[:notif]
		@notifid=notifid
		file=File.read("public/users.json")
		data_hash = JSON.parse(file)
		f=File.open("public/users.json","w")
		students=data_hash["students"]
		#respond_to do |format|
					students.each do |data|
						if data["id"] == getid
							notifs = data["notifids"].split(',')
		    				notifs.map!{ |n| n.to_i }
							notifs.delete(notifid.to_i)
							notifs=notifs.join(',')
							data["notifids"]=notifs
						end
					end
			data_hash["students"]=students
			data_hash=data_hash.to_json
			if f.write(data_hash)
				respond_to do |format|
				format.js
				end
			end
    		
  		#end
	end
end
