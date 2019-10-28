class PostsController < ApplicationController
	 ## before_action :find_post, only: [:show, :update, :edit, :destroy]

	def index
		#@posts = Post.all.order("created_at DESC")
		@posts = Post.all
  			if params[:search]
    			@posts = Post.search(params[:search]).order("created_at DESC")
  			else
    			@posts = Post.all.order('created_at DESC')
  			end
	end

	def new
		#Created a new Post object and assign it to a new variable instance called @Post
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		#Post.find(params[:id]) - Using the Post model and the find method to retrieve an individual post [id] 
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find params[:id]
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end
	
	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	# def find_post
	# 	@post = Post.find(params[:id])
	# end

end
