module Users
  class PostPolicy < ApplicationPolicy
    authorize :user, allow_nil: true

    def index?
      user.present?
    end

    def show?
      true
    end

    def new?
      user.present?
    end

    def edit?
      true if record&.user_id == user.id
    end

    def create?
      new?
    end

    alias update? edit?
    alias destroy? update?
  end
end
