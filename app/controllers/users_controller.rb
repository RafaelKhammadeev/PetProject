class UsersController < ApplicationController
  decorates_assigned :users
  before_action :set_user, only: %i[show destroy]

  # GET /users or /users.json
  def index
    @users = User.all.excluding(current_user)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path, success: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :surname)
  end
end
