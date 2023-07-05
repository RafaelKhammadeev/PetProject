module ApplicationHelper
  def time_posted(obj)
    if (obj.updated_at - obj.created_at) > 1
      "Edited #{time_ago_in_words(obj.updated_at)} ago"
    else
      "Posted #{time_ago_in_words(obj.created_at)} ago"
    end
  end
end
