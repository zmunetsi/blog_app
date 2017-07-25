class PagesController < ApplicationController
  def home
    @posts = Post.all.order("created_at DESC").limit(5)
    @categories =Category.all.limit(5)
  end
  def about
  end

  def contact
  end
end
