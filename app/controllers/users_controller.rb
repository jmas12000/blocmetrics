class UsersController < ApplicationController
  def show
    @user = current_user
    @registered_applications = @user.registered_applications if user_signed_in?
    @registered_application = RegisteredApplication.new
  end
end
