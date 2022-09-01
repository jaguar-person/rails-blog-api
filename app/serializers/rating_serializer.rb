class RatingSerializer < ActiveModel::Serializer
  attributes :user_id, :post_id, :value
end
