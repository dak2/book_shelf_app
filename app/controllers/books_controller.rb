class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  require 'net/http'
  require 'uri'
  require 'json'

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(get_book_with_api(book_params[:title]))

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: '本を新規登録しました。' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: '本の情報を更新しました。' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_uri, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Get book info with google books api
  def get_book_with_api(title)
    uri = URI.parse("https://www.googleapis.com/books/v1/volumes?q=#{title}")
    @book_info_hash = connect_api(uri)["items"].first["volumeInfo"]
                     .select{ |key, value| key == "title" || key == "description" }
  end

  def connect_api(uri)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = https.request(request)
    JSON.parse(response.body)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :description)
  end
end
