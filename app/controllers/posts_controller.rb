class PostsController < ApplicationController
  def index
    @posts = Post.select(:description, :created_at).order(created_at: :desc).limit(10) #Esta variable es para usarla en la vista
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to posts_path, notice: 'The post was successfully created'
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:description, :location)
    end
end


