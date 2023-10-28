# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Bu kod, belirtilen e-posta adresiyle kullanıcıları oluşturur veya mevcut değilse yeni kullanıcıları oluşturur.
bulent = User.first_or_create!(email: "bropil@gmail.com",
                              password: "123456", 
                              password_confirmation: "123456",
                              first_name: "Bülent",
                              last_name: "Er",
                              role: User.roles[:admin])
puts "Creating User #{bulent.first_name} #{bulent.last_name}"

ezel = User.create(email: "ezel@gmail.com",
                            password: "123456", 
                            password_confirmation: "123456",
                            first_name: "Ezel",
                            last_name: "Er",
                            role: User.roles[:user])

puts "Creating User #{ezel.first_name} #{ezel.last_name}"

Address.first_or_create!(street: "123 Main St.",
                       city: "Andtown",
                       state: "CA",
                       zip: "12345",
                       country: "USA",
                       user: bulent)
puts "Creating Address for #{bulent.first_name} #{bulent.last_name}"

Address.create(street: "321 Sample St.",
                       city: "Starttown",
                       state: "LA",
                       zip: "54321",
                       country: "USA",
                       user: ezel)
puts "Creating Address for #{ezel.first_name} #{ezel.last_name}"

elapsed = Benchmark.measure do
 posts = []
  10.times do |x|
    puts "Creating post #{x+1}"
    post = Post.new(
      title: "Post #{x+1}", 
      slug: nil,
      body: Faker::Lorem.sentence(word_count: 10*(x+1)), 
      user: (x.even? ? bulent : ezel))

      5.times do |y|
        puts "Creating comment #{y+1} for post #{x+1}"
        post.comments.build(
            body: Faker::Lorem.sentence(word_count: 5*(y+1)), 
            user: (y.odd? ? bulent : ezel))
      end
      posts << post
  end
  Post.import(posts, recursive: true)
end
puts "Done!"

puts "Seeded Development DB in #{elapsed.real} seconds"