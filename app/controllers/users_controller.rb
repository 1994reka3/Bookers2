class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
