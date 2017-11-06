class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = Blog.recent.page(params[:page]).per(5)
    else
      @blogs = Blog.published.page(params[:page]).per(5)
    end
  end

  private 

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
