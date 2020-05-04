class FavoritesController < ApplicationController
  before_action :baria_favorite

  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: params[:book_id])
    favorite.save
  end

  def destroy

    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy
  end

  private
  def baria_favorite
    if favorite.present?
      favorite = Favorite .find_by(book_id: book.id, user_id: current_user)
    end
  end
end
