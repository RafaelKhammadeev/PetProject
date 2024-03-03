class HandleTestPostJob < ApplicationJob
  def perform(post, user)
    post.comments.create!(text: "comment #{rand(1..1000)}", user:, post_id: post.id)
  end
end
