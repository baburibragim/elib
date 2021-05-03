class BooksController < ApplicationController

  def index
    @books = Book.newest
  end

  def new
    @book = Book.new
  end

  def all
    @books = Book.all_ordered_by_name
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Книга была успешна добавлена!'
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Книга была успешна обновлена!'
    else
      render :edit
    end
  end

  def search
    @query = params[:query]
    @books = Book.search(params[:query])
  end

  # def destroy
  #   @book = Book.find(params[:id])
  #   @book.visible = false
  #   @book.save
  #   redirect_to books_url, alert: "Книга «#{@book.name}» была успешна скрыта!"
  # end

  private

  def book_params
    params.require(:book)
      .permit(:name, :author, :description, :almaty_quantity, :shymkent_quantity, :image_src, :category, :visible)
  end

end
