class CommentsController < ApplicationController
	
http_basic_authenticate_with name:"dhh", password: "secret", only: :destroy
	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(allowPara)
    redirect_to article_path(@article)
	end


	def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
	end

	private 
	def allowPara
		params.require(:comment).permit(:body,:commenter)
	end

end
