class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  before_action :set_admin, only: [:dashboard]
  before_action :find_user, only: [:destroy]

  def dashboard
    @logged_user = User.find(current_user.id)
    @user_posts = @logged_user.posts.paginate(:page => params[:page], :per_page => 5)

    @posts = Post.paginate(:page => params[:page], :per_page => 5)
    @users = User.all
    
  end

  def destroy
    if @user.destroy
      flash[:success] = "Successfully deleted user!"
      redirect_to users_dashboard_path
    else
      flash[:danger] = "Error deleting user!"
    end
  end

 private
  def set_admin
    if current_user.email ==  "admin@gmail.com"
       current_user.update_attribute :admin, true
    end

  end

  def find_user
    @user = User.find(params[:id])
  end


end
