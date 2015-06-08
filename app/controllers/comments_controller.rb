class CommentsController < ApplicationController
	def create
		comment = params[:comment][:newcomment]
		id = params[:comment][:id]
		@post = Post.find_by(id: id)
		userid = getid
		@comment=Comment.new(content: comment,post_id: id,user_id: userid)
		respond_to do |format|
			@comment.save
			format.html { redirect_to posts_path }
			format.js	{}
		end
	end
end
