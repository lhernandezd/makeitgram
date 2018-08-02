class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create] #Autenticación requerida para utilizar el metodo create

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to :js
      #redirect_to root_path
    else
      redirect_to root_path, error: "Text can't be blank" 
    end
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:text)
          .merge(user_id: current_user.id, post_id: params[:id])
  end

end
