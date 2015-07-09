class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def error

	render :error
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy	
		redirect_to root_path
	end

	def show
		@comment = Comment.find(params[:id])
		@post = Post.find(params[:post_id])
	end

	def edit
		@post = Post.find(params[:post_id])
			@comment = Comment.find(params[:id])
	end

	def update
			@post = Post.find(params[:post_id])
			@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to @post
		else
			render :error
		end
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.post_id = @post.id
		if @comment.save
			redirect_to post_path(@post)
		else
			render :error
		end
	end

	def comment_params
		params.require(:comment).permit(:content)
	end

end