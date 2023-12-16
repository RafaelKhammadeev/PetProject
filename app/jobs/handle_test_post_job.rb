class HandleTestPostJob < ActiveJob::Base
  def perform(post, current_user)
    (1..10).each do |i|
      post.comments.create!(text: "comment #{i}", user: current_user, post_id: post.id)
    end
  end
end