class ReflectionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :mirror_id, :o, :c, :e, :a, :n
end
