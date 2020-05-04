class BookCommentsController < ApplicationController
  def create
    @created_book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @created_book.id
    if @book_comment.save
      redirect_to book_path(@created_book)
    else
      @book = Book.new
      @post_book = Book.find(params[:book_id])
      render 'books/show'
    end
  end

  def destroy
    # baria_book_comment

    book = Book.find(params[:book_id])
    comment = BookComment.find(params[:id])
    comment.destroy
    redirect_to book_path(book)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def baria_book_comment
    comment = BookComment.find(params[:id])
    unless comment.user_id == current_user.id
    redirect_to books_path
    end
  end


end
