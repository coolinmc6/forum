class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user
		@comment.save

		if @comment.save 
			redirect_to post_path(@post)
		else
			redirect_to root_path
		end
		
	end

	private

	def comment_params
		params[:comment].permit(:comment, :user_id)
	end


end
