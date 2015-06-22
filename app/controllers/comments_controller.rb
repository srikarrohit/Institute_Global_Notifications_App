class CommentsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :create
	def create
		comment = params[:comment][:newcomment]
		id = params[:comment][:id]
		@post = Post.find_by(id: id)
		userid = getid
		@comment=Comment.new(content: comment,post_id: id,user_id: userid)
		respond_to do |format|
			if @comment.save
				format.html { redirect_to posts_path }
				format.js	{}
			else
				redirect_to posts_path
			end
		end
	end
end
