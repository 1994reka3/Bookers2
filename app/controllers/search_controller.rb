class SearchController < ApplicationController

  before_action :authenticate_user!

  def search
    @user_or_book = params[:search_model]
    @search_how = params[:search_how]
    @search = params[:search]
    if @user_or_book == "1"
      @users = User.search(params[:search],@user_or_book, @search_how)
    else
      @books = Book.search(params[:search],@user_or_book, @search_how)
    end
  end

end
