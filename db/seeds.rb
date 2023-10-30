# puts "Seeding database..."
# load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))





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

category = Category.create(name: "Uncategorized", display_in_nav: true)
Category.create(name: "Cars", display_in_nav: false)
Category.create(name: "Bikes", display_in_nav: true)
Category.create(name: "Boats", display_in_nav: true)


elapsed = Benchmark.measure do
 posts = []
  10.times do |x|
    puts "Creating post #{x+1}"
    post = Post.new(
      title: "Post #{x+1}", 
      slug: nil,
      body: Faker::Lorem.sentence(word_count: 10*(x+1)), 
      category: category,
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

Post.find_each(&:save)
Category.find_each(&:save)
User.find_each(&:save)
puts "Saved Friendly IDs"