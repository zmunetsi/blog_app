#app/controllers/posts_controller.rb

class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # Index action to render all posts
  def index
    @posts = Post.all
  end

  # New action for creating post
  def new
    @post = Post.new
  end

  # Create action saves the post into database
   def create

    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:danger] = "You have successfully created a post"
      redirect_to post_path(@post)
    else
      flash[:error] = "Error creating new post!"
      render :new
    end
   end

  # Edit action retrives the post and renders the edit page
  def edit
  end

  # Update action updates the post with the new information
  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Successfully updated post!"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Error updating post!"
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the the id
  def show
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @post.destroy
      flash[:success] = "Successfully deleted post!"
      redirect_to users_dashboard_path
    else
      flash[:danger] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
