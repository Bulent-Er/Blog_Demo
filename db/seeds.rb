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

posts = []
comments = []
elapsed = Benchmark.measure do
  10.times do |x|
    puts "Creating post #{x+1}"
    post = Post.new(
      title: "Post #{x+1}", 
      slug: nil,
      body: Faker::Lorem.sentence(word_count: 10*(x+1)), 
      user_id: x.odd? ? User.find(1).id : User.find(2).id)
      post.save!
      posts << post
      
      5.times do |y|
      puts "Creating comment #{y+1} for post #{x+1}"
      comment = Comment.new(
          post_id:  post.id,
          body: Faker::Lorem.sentence(word_count: 5*(y+1)), 
          user_id: y.even? ? User.find(1).id : User.find(2).id)
          comment.save!
          comments << comment
      end
  end
end
# Post.import(posts)
# Comment.import(comments)
puts "Done!"

puts "Creating #{Post.count} posts and #{Comment.count} comments took #{elapsed.real} seconds"