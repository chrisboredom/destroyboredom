class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :search]

	def search
		if params[:search].present?
      @posts = Post.search(params[:search])
    else
      @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
    end
	end

	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
	end

	def new
		@post = current_user.posts.build
	end

	def show
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :photo, :slug)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end
end
