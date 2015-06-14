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
		categoryid = params[:post][:cat_id]
		@post = Post.new(content: post, title: title, cat_id: categoryid)
		@post.user_id = getid
		if @post.save
			@notif = Notification.new
			@notif.user_id = getid
			@notif.post_id = @post.id
			@notif.cat_id = @post.cat_id
			@notif.message = @post.user.fullname + " " + "Posted"
			@notif.save
			@usercats = Usercat.all
			@usercats.each do |usercat|
				cats = usercat.categories
				cats = cats.split(',')
				cats.map!{ |c| c.to_i }
				cats.each do |cat|
					if cat == @notif.cat_id
						if usercat.notifids.nil?
							usercat.notifids = @notif.id
							usercat.save
						else
							u=usercat.notifids
							u=u+","+@notif.id.to_s
							usercat.notifids=u
							usercat.save
						end
					end
				end
			end
			redirect_to posts_path
		else
			render 'new'
		end
	end
	def show
		@post = Post.find(params[:id])
		@comments = Comment.where(post_id: @post.id)
		id = params[:id]
		usercats=Usercat.all
		usercats.each do |usrcat|
			if getid == usrcat.user_id
				cats = usrcat.notifids
        cats = cats.split(',')
        cats.map!{ |c| c.to_i }
				n = Notification.find_by(post_id: id)
				nid = n.id
				cats.map!{ |notifid| 
					if notifid==nid 
							notifid=nil
					else
						notifid=notifid
					end }
				cats.compact!
				cats = cats.join(',')
				usrcat.notifids = cats
				usrcat.save
			end
		end
	end
	private 
		def post_params
			params.require(:post).permit(:newpost,current_user.id)
		end
end
