class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

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
    if @blog && @blog.update(blog_params)
        render json: @blog
    else
        render json: { error: @blog&.errors&.full_messages&.join(". ") }, status: :unprocessable_entity
    end
  end

  def destroy
    if @blog && @blog.destroy
      render status: :no_content
    else
      render json: { error: @blog&.errors&.full_messages&.join(". ") }, status: :unprocessable_entity
    end
  end

  def search
    render json: Blog.search_blog(params[:query])
  end

  private

  def set_blog
    @blog ||= Blog.find_by(id: params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :subheader)
  end
end
