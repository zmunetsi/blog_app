class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  before_action :set_admin, only: [:dashboard]

  def dashboard
    @user = User.find(current_user.id)
    @user_posts = @user.posts.paginate(:page => params[:page], :per_page => 5)

    @posts = Post.paginate(:page => params[:page], :per_page => 5)
    @users = User.all
  end

 private
  def set_admin
    if current_user.email ==  "admin@gmail.com"
       current_user.update_attribute :admin, true
    end

  end
end
