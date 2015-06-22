class CatsController < ApplicationController
  def index
		@cats=Cat.all
		u=Usercat.find_by(user_id: getid)
		if !u.nil?#added this to correct it check what u want
			@check=u.categories
		end
		#raise @check.inspect
  end
	def create
		p=params[:category]
		if !p.nil?
			l= params[:category].length
			i=0
			cats=Array.new
			while i<20 do
				i+=1
				cat=params[:category][i.to_s]
				cats.push cat
			end
		else
      cats=Array.new
    end
		cats.compact!
		cats=cats.join(',')
		user=User.find_by(id: getid)
		usercat0=Usercat.find_by(user_id: user)
		if usercat0 == nil
			usercat= Usercat.new( user_id: getid, categories: cats)
		usercat.save
		redirect_to cats_path
		else
			usercat0.update(user_id: getid, categories: cats)
			redirect_to cats_path
		end
	end
end
