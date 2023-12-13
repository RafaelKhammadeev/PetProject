# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Post.destroy_all
Feedback.destroy_all

admin = User.create!(email: "admin@admin.com", password: "123456", name: "Admin", surname: "Admin", role: "admin")
test = User.create!(email: "test@test.com", password: "123456", name: "Test", surname: "Test")

10.times do |x|
  Post.create!(title: "Title #{x}", description: "Description #{x}", status: "public", user: admin)
end

3.times do |x|
  Feedback.create!(title: "Feedback Title #{x}", message: "Feedback Message #{x}", user: test)
end
