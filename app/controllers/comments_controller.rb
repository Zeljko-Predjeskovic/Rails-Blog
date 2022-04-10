class CommentsController < ApplicationController
	include ApplicationHelper

  #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def create
	    @article = Article.find(params[:article_id])
	    @comment = @article.comments.create(comment_params)
	    redirect_to user_article_path(current_user.id, @article)
  	end

  	def destroy
    	@article = Article.find(params[:article_id])
    	@comment = @article.comments.find(params[:id])
    	@comment.destroy
    	redirect_to user_article_path(current_user.id, @article), status: 303
  	end  	

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

end
