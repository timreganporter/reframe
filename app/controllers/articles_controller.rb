class ArticlesController < ApplicationController

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:info] = "Thank you for submitting an article"
      redirect_to articles_url
    else
      render 'new'
    end
  end

  private

    def article_params
      params.require(:article).permit(:url, :headline, :summary)
    end
end
