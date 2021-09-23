# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.reset_pk_sequence
Friendship.destroy_all
Friendship.reset_pk_sequence
FriendRequest.destroy_all
FriendRequest.reset_pk_sequence

User.create(username: 'arthur', email: 'arthurvfain@gmail.com', first_name: 'Arthur', last_name: 'Fain', password: '123')
User.create(username: 'savahanna', email: 'ssavahanna@gmail.com', first_name: 'Savahanna', last_name: 'Salsone', password: '123')
User.create(username: 'bobo', email: 'vincentvfain@gmail.com', first_name: 'Vincent', last_name: 'Fain', password: '123')

Friendship.create(user_id: 1, friend_id: 2)
Friendship.create(user_id: 2, friend_id: 1)

FriendRequest.create(requester_id: 3, requestee_id:1)
FriendRequest.create(requester_id: 3, requestee_id:2)

puts "Seeding Done !"