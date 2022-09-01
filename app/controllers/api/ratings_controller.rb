class Api::RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    if @rating.invalid?
      render json: @rating.errors.messages, status: :unprocessable_entity
      nil
    else
      @rating.save
    end
  end

  private

  def rating_params
    params.permit(:user_id, :post_id, :value)
  end
end
