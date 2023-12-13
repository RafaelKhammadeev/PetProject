after :users do
  user = User.find_by!(email: "test@example.com")

  10.times do |x|
    Post.create!(title: "Title #{x}", description: "Description #{x}", status: "public", user:)
  end
end