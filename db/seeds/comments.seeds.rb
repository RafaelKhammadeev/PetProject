after :users, :posts do
  user = User.find_by!(email: "test@example.com")
  post = Post.first

  5.times do |x|
    Comment.create!(text: "Comment #{x}", user_id: user.id, post_id: post.id)
  end
end