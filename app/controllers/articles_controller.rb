class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @like = Like.where(params[:like_id])
    @user = User.all

  end

  def new
    @article = Article.new
  end


  def post_form
    @article = Article.new(title: params[:title], description: params[:description])
       respond_to do |format|
    if @article.save
      format.js
       format.html {redirect_to root_path, notice: "Article created successfully."}
       redirect_to root_path
      end
     end
   end

  def create
    @article = Article.new(article_params)
      respond_to do |format|
    if @article.save
      format.js
      format.html {redirect_to root_path, notice: "Article created successfully."}
      # format.json {render :index, status: :created, location: @article}
   
    else
      format.js
      format.html {render :new, notice: "Article.not created"}
       #format.json {render json: @article.errors, status: :unprocessable_entity}
    
     end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
     respond_to do |format|
          format.js
      end
  end

  def update
    @article = Article.find(params[:id])
      respond_to do |format|
    if @article.update(article_params)
      format.js
      format.html {redirect_to root_path, notice: "Article Update successfully"}
      format.json {render :index, status: :created, location: @article}
   
     else
      format.js
      format.html {render :edit, notice: "Article in not updated"}
      format.json {render json: @article.errors,status: :unprocessable_entity}
      end
   end
 end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html{redirect_to root_path, notice: "Article destr oy"}
      format.json{head :no_content}
      format.js
      redirect_to root_path
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :avatar)
    end
end
