class PostPolicy < ApplicationPolicy
  def edit?
    true if record&.user_id == user.id
  end

  alias update? edit?
  alias destroy? edit?
end
