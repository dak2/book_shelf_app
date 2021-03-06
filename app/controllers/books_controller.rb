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
    @book = Book.new
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
      format.html { redirect_to books_uri, notice: '本を削除しました。' }
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
    uri = URI.parse(URI.encode("https://www.googleapis.com/books/v1/volumes?q=#{title}"))
    service = Books::ApiConnectService.new(uri)
    book_response = service.execute["items"].first["volumeInfo"]
                     .select{ |key, value| key == "title" || key == "description" || key == "publisher" || key == "publishedDate" || key == "imageLinks"}
    @book_info_hash = book_response.inject({}) do |hash, (key, value)|
      if key.underscore == "image_links"
        hash[key.underscore] = book_response["imageLinks"]["smallThumbnail"]
      else
        hash[key.underscore] = value
      end
      hash
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :description)
  end
end
