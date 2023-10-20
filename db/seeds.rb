# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "bropil@gmail.com",name: "Bülent" password: "123456", password_confirmation: "123456")
User.create(email: "ezel@gmail.com",name: "Ezel" password: "123456", password_confirmation: "123456")
5.times do |index|
  Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph_by_chars.truncate((index+1)*20), user_id: User.first.id)
end
5.times do |index|
  Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph_by_chars.truncate((index+1)*20), user_id: User.find(2).id)
end


