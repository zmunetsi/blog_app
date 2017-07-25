class CategoriesController < ApplicationController
  before_action :find_cat, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # Index action to render all posts
  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 10)
  end

  # New action for creating post
  def new
    @category = Category.new
  end

  # Create action saves the post into database
   def create
     @category = Category.new(cat_params)

     if @category.save
       flash[:danger] = "You have successfully created a category"
       redirect_to users_dashboard_path
     else
       flash[:error] = "Error creating new category!"
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
    @cat_posts = @cat.posts.paginate(:page => params[:page], :per_page => 10)
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


  def cat_params
    params.require(:category).permit(:name, :description)
  end

  def find_cat
    @cat = Category.find(params[:id])
  end
end
