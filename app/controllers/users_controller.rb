class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = current_user
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to view user profile"
      redirect_to new_user_session_path
    end
  end

end
