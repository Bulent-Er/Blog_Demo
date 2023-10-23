# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
  email: "bropil@gmail.com",
  name: "Bülent",
  password: "123456", 
  password_confirmation: "123456",
  role: User.roles[:admin])

User.create(
  email: "ezel@gmail.com",
  name: "Ezel",
  password: "123456", 
  password_confirmation: "123456")

10.times do |x|
  post = Post.create(
    title: "Post #{x+1}", 
    body: Faker::Lorem.sentence(word_count: 10*(x+1)), 
    user_id: x.odd? ? User.find(1).id : User.find(2).id)
    
    5.times do |y|
      Comment.create(
        post_id:  post.id,
        body: Faker::Lorem.sentence(word_count: 5*(y+1)), 
        user_id: y.even? ? User.find(1).id : User.find(2).id)
    end
end


