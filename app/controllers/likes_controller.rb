class LikesController < ApplicationController

 before_action :find_like, only: [:destroy]

 def index
  @likes = Like.all
 end

 def new
 	@like = Like.new
 end

 def create
    @article = User.find_by(id:current_usermail.id)
    @article = Article.first
    @like = @article.likes.create(article_id: @article.id)
    redirect_to root_path
 end
 
def destroy
  if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
  	 @like.destroy
       redirect_to root_path
    end
end

 def find_article
    @article = Article.find(params[:article_id])
 end

 def find_like
   @like = @article.likes.find(params[:id])
 end

end

