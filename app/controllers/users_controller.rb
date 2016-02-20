class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :role, :avatar)
end
