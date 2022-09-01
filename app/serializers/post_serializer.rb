class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :ip, :user_id, :user
  attribute :avg_rating, if: :avg_rating?

  def user
    object.user
  end

  def avg_rating?
    true if instance_options[:avg_rating]
  end
end
