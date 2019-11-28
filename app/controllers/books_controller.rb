class BooksController < ApplicationController

	def top
	end

  def index
  	@books = Book.all#全て取得
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])#idを指定したデータをdbから探す

  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  		flash[:notice] = "successfully"

  	redirect_to book_path(book)#編集したshowページに飛ぶ
  end
  end

  def new

  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		flash[:notice] = "successfully"
  	redirect_to book_path(@book)#showページに飛ぶ
  	else
  	@books = Book.all
  	render :index
  	end
  end


   def destroy
   	book = Book.find(params[:id])
   	book.destroy
   	redirect_to books_path
   end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end