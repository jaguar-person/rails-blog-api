class PostSerializer < ActiveModel::Serializer
  attributes :id

  def user
    objects.user
  end
end
