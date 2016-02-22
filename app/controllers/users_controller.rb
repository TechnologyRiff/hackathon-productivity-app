class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @notes = current_user.notes
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :role, :avatar)
  end
end
