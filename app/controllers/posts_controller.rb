class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy download]
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post deleted successfully!"
  end

  def download
    post_pdf = @post.generate_post_pdf
    #provide preview as pdf option 
    if params[:preview].present?
      send_data(post_pdf.render, filename: "#{@post.title}.pdf",
              type: 'application/pdf', disposition: 'inline')
    else
      send_data(post_pdf.render, filename: "#{@post.title}.pdf",
                type: 'application/pdf')
    end
  end
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :cover_image)
  end
end
