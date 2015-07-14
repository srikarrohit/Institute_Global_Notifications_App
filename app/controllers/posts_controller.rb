class PostsController < ApplicationController
	def index
		postss=Array.new
		usercat=Usercat.find_by(user_id: getid)
		if !usercat.nil? && !(usercat.categories).empty?#small doubt here
			cats= usercat.categories
    	cats = cats.split(',')
    	cats.map!{ |c| c.to_i }
    	cats.each do |cat|
				posts=Post.where(cat_id: cat)
				posts.each do |post|
					postss.push post
				end
			end
			@posts=postss
		else
			@posts=Post.all
		end
	end
	def new
		@post = Post.new
		@cats = Cat.all
	end
	def create
		@cats=Cat.all#when the form is submitted and goes to this actio, @cats is no more a variable provided by the controller so need to call again
		post = params[:post][:content]
		title = params[:post][:title]
		categoryid = params[:post][:cat_id]
		fromdate=params[:post][:fromdate]
	#	if fromdate!=""
	#	fromdate=Date.parse(fromdate).strftime("%Y-%d-%m")
	#	end
		todate=params[:post][:todate]
	#	if todate!=""
	#	todate=Date.parse(todate).strftime("%Y-%d-%m")
	#	end
		date=params[:post][:date]
		time=params[:post][:time]
		location=params[:post][:location]
		@post = Post.new(content: post, title: title, cat_id: categoryid,fromdate: fromdate, todate: todate, date: date, time: time, location: location)
		@post.user_id = getid
		if @post.save
			@notif = Notification.new
			@notif.user_id = getid
			@notif.post_id = @post.id
			@notif.cat_id = @post.cat_id
			@notif.message = @post.user.fullname + " " + "Posted"
			@notif.save
			@usercats = Usercat.all
			redirect_to posts_path
		else
			render 'new'
		end
	end
	def show
		if params[:id].include? "@"
			p=params[:id].split('@')
			@post = Post.find(p[0])
			respond_to do |format|
        	format.js
        	end	
        else
        	@post = Post.find(params[:id])
    	end
		@comments = Comment.where(post_id: @post.id)
	end
	  def search
    @posts = []
  
      @posts_title = Post.search(params[:search], 'title')
      @posts = @posts + @posts_title
      @posts_contents = Post.search(params[:search], 'content' )
      @posts = @posts + @posts_contents

      @posts_contents = Post.search(params[:search], 'fromdate' )
      @posts = @posts + @posts_contents
      @posts_contents = Post.search(params[:search], 'todate' )
      @posts = @posts + @posts_contents
       @posts_contents = Post.search(params[:search], 'date' )
      @posts = @posts + @posts_contents
      
    #end
   
    #end
  end
	private 
		def post_params
			params.require(:post).permit(:newpost,current_user.id)
		end
end
