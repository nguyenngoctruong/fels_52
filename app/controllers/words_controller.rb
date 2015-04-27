class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.all
    @words = Word.paginate page: params[:page], per_page: 10
  end
end
