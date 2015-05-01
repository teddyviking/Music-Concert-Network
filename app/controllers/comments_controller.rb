class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@concert = Concert.find params[:id]
  	@comment = @concert.comments.new permited_params
  	if @comment.save 
  		flash.now[:notice] = "Comment created"
  		redirect_to concert_path(@concert)
  	else
  		flash.now[:alert] = "Comment not valid"
  		render 'concerts/show'
  	end
  end

  private

  def permited_params
  	params.require(:comment).permit(:user, :content)
  end
end
