after :users, :posts do
  user = User.find_by!(email: "test@example.com")
  post = Post.first

  5.times do |x|
    comment = Comment.create!(text: "Comment #{x}", user_id: user.id, post_id: post.id)

    PostComment.create!(post_id: post.id, comment_id: comment.id)
  end
end