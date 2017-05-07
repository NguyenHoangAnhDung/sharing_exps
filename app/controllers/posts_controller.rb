class PostsController < ApplicationController
  def index
    if params[:id]
      @posts = Post.where('id < ?', params[:id]).last(5).reverse
    else
      @posts = Post.last(5).reverse
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = "Success"
      redirect_to @post
    else
      flash.now[:danger] = "Something wrong"
      render :new
    end
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  private
  def post_params
    params.require(:post).permit :title, :content
  end
end
