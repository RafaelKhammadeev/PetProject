class PostPolicy < ActionPolicy::Base
  authorize :user, allow_nil: true

  scope_for :relation do |relation|
    if user.nil?
      relation.where(status: 'Draft')
    elsif user.present?
      relation.where(user_id: user)
    end
  end
end
