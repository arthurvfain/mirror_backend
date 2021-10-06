class UserDetailsSerializer < ActiveModel::Serializer
    attributes :id, :username, :first_name, :last_name
    has_many :friends
    has_many :friend_requests
  end
  