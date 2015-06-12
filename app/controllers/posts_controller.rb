class PostsController < ApplicationController
	def index
	@posts = Post.all
	end
	def new
	@post = Post.new
	@cats = Cat.all
	end
	def create
		post = params[:post][:content]
		title = params[:post][:title]
		@post = Post.new(content: post, title: title)
		@post.user_id = getid
		if @post.save
			@notif = Notification.new
			@notif.user_id = getid
			@notif.post_id = @post.id
			@notif.message = @post.user.fullname + " " + "Posted"
			@notif.save
			redirect_to posts_path
		else
			render 'new'
		end
	end
	def show
	#	@user = User.find_by(id: id)
	#	id = getid
	#	posted = Post.where(user_id: id)
		@post = Post.find(params[:id])
		@comments = Comment.where(post_id: @post.id)
	#	@postedby = User.find_by(id: post.user_id)
#		@comments=Comment.all
	#	@user = User.find(params[:id])
	#	@posts = @user.posts
#		puts post
			
end
	private 
		def post_params
			params.require(:post).permit(:newpost,current_user.id)
		end
end
