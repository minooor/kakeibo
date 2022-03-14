class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "家計簿にデータを１件登録しました"
      redirect_to books_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "データを１件更新しました"
      redirect_to books_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "削除しました"
    redirect_to books_path
  end

  private
   def book_params
     params.require(:book).permit(:year, :month, :inout, :category, :amount)
   end
end
