class PostsController < ApplicationController

    def index
        @posts = Post.all
        @votes = Vote.all
        @user = User.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
      return unless is_authenticated?
      user = User.find_by_id(@current_user['id'])
      @post = user.posts.create post_params
      if @post.errors.any?
        render :new
      else
        flash[:success] = 'Post added'
        redirect_to posts_path
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def comments
      @post = Post.find_by_id(params[:id])
      @comment = Comment.new

    end

    def create_comment
      return unless is_authenticated?
      user = User.find_by_id(@current_user['id'])
      post = Post.find_by_id(params[:id])
      # @vote = Vote.find_by_id(params[:id])
        user.comments << post.comments.create({body:params[:comment][:body]})
      redirect_to post_comments_path
      # render json: user
    end

    def create_vote
      return unless is_authenticated?
      user = User.find_by_id(@current_user['id'])
      post = Post.find_by_id(params[:id])
    if post.votes.where(user_id: user[:id]).length < 1
      user.votes << post.votes.create()
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:link)
  end

end