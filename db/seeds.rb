# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all restaurants"
Restaurant.destroy_all

puts "Creating new restaurants"
10.times do
  restaurant = Restaurant.create(
    name: Faker::Superhero.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
end
puts "Finished!"

puts "Creating new reviews"
30.times do
  review = Review.create(
    content: Faker::Quote.famous_last_words,
    rating: rand(0..5),
    restaurant_id: rand(52..61)
  )
end
