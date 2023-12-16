class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :set_decorated_user, only: %i[show]

  def index
    @decorated_users = User.excluding(current_user).decorate
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path, success: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_decorated_user
    @decorated_user = set_user.decorate
  end

  def user_params
    params.require(:user).permit(:name, :surname)
  end
end
