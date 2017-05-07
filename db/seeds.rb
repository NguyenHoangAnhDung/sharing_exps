# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
5.times do |i|
  User.create! name: "User#{i + 1}", email: "email#{i + 1}@gmail.com", password: "123123123",
    password_confirmation: "123123123"
end

Post.destroy_all
User.all.each do |user|
  3.times do |i|
    Post.create! title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: user.id
  end
end
