class Api::PostsController < ApplicationController
  def index
    @posts = Post.left_outer_joins(:ratings).select("posts.*, coalesce(avg(ratings.value), 0) as avg_rating").group(
      "posts.id", "posts.title"
    ).order("avg_rating DESC").limit(10)

    render json: @posts, avg_rating: true, status: :ok
  end

  def create
    @post = Post.new({ "title" => post_params[:title], "body" => post_params[:body], "ip" => post_params[:ip],
                       "user_id" => user_id })

    if @post.invalid?
      render json: @post.errors.messages, status: :unprocessable_entity
      return
    else
      @post.save
    end

    render json: @post, avg_rating: false, status: :ok
  end

  private

  def user_id
    @creator = User.find_by(login: post_params[:login])
    unless @creator
      @creator = User.new(login: post_params[:login])
      @creator.save
    end

    @creator.id
  end

  def post_params
    params.permit(:title, :body, :login, :ip)
  end
end
