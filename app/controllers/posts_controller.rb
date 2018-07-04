class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).limit(10) #Esta variable es para usarla en la vista
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1
    if @post.save 
      redirect_to posts_path, notice: 'The post was successfully created'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])#en el find si solo es una variable busca por defecto el id
  end

  private
    def post_params
      params.require(:post).permit(:photo, :description, :location)
    end
end

