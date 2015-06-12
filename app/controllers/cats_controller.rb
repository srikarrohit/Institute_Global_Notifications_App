class CatsController < ApplicationController
  def index
		@cats=Cat.all
  end
	def create
		cat1= params[:category]["1"]
		cat2= params[:category]["2"]
		cat3= params[:category]["3"]
		cat4= params[:category]["4"]
		cat5= params[:category]["5"]
		user=User.find_by(id: getid)
		usercat0=Usercat.find_by(user_id: user)
		if usercat0 == nil
			usercat= Usercat.new( user_id: getid, cat1: cat1, cat2: cat2, cat3: cat3, cat4: cat4, cat5: cat5)
		usercat.save
		redirect_to cats_path
		else
			usercat0.update(user_id: getid, cat1: cat1, cat2: cat2, cat3: cat3, cat4: cat4, cat5: cat5)
			redirect_to cats_path
		end
	end
end
