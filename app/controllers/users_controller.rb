class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  before_action :set_admin, only: [:dashboard]
  def dashboard
    @user = User.find(current_user.id)
    @posts = Post.all
    @users = User.all
  end

  private

  def set_admin
    if current_user.email ==  "zunguziramunetsi@gmail.com"
       current_user.update_attribute :admin, true
    end

  end
end
