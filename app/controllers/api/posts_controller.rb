class Api::PostsController < ApplicationController
  def create
    @post = Post.new({ "title" => post_params[:title], "body" => post_params[:body], "ip" => post_params[:ip],
                       "user_id" => user_id })

    if @post.invalid?
      render json: @post.errors.messages, status: 422
      return
    else
      @post.save
    end

    render json: @post, include: ["user"], status: :ok
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