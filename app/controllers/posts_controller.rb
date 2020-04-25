class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_books, only: %i(edit new)
  before_action :set_users, only: %i(edit new)

  # GET /posts
  # GET /posts.json
  def index
    posted_user_ids = User.has_posted.pluck(:id)
    @posts = Post.includes(:book, :user).where(user_id: posted_user_ids)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
    user_posted!

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t('activerecord.flash.post.success') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t('activerecord.flash.post.update') }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: t('activerecord.flash.post.destroy') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_books
    @books = Book.all.pluck(:title, :id)
  end

  def set_users
    @users = User.all.pluck(:name, :id)
  end

  def user_posted!
    posted_user = User.find(current_user.id)
    posted_user.has_posted!
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :book_id)
  end
end
