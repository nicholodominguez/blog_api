class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update]

  def index
    render json: Blog.all
  end

  def show
    render json: @blog
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
        render json: blog
    else
        render json: { error: blog.errors.full_messages.join(". ") }, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
        render json: @blog
    else
        render json: { error: @blog.errors.full_messages.join(". ") }
    end
  end

  private

  def set_blog
    @blog ||= Blog.find_by(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :subheader)
  end
end
