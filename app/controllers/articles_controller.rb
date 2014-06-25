class ArticlesController < ApplicationController
  

  

  def new 
    @article = Article.new
  end

   def index
   @articles = Article.all
  end

  def create
  @article = Article.new(allow_params)
 
  if @article.save
      redirect_to @article
  else render 'new'
  end    
  end
 


 
def update
  @article = Article.find(params[:id])
  #if Article.update(params[:id],allow_params)
  if @article.update_attributes(allow_params)
    redirect_to @article
  else
   render 'edit'
  end
  end  


  def edit
  @article = Article.find(params[:id])
  end

  


  def show
      @article = Article.find( params[:id] )
  end




  def destroy
     @article = Article.find( params[:id])
     @article.destroy
     redirect_to articles_path
  end
  
private
  def allow_params
    params.require(:article).permit(:title, :text)
  end
#methods defined below a private method will become private  


end
