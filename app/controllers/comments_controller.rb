class CommentsController < ApplicationController
 # before_filter :authenticate_member!, only: [:new, :create, :destroy]
  #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def new
  end

  def create
    @article=Article.find(params[:article_id])
    @comment=@article.comments.create(comment_params)
    puts "working"
    redirect_to article_path(@article), method: :GET
    #@comments.save!
  end

  def update
  end

  def destroy
    @article=Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy!
    redirect_to article_path(@article), method: :GET
  end

  def show
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
