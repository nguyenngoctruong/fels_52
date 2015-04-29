class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :require_admin

  def index
    @categories = Category.all
    @words = Word.paginate page: params[:page], per_page: 10
  end

  def new
    @category = Category.find params[:category_id]
    @word = Word.new
    4.times{@word.answers.build}
  end

  def create
    @category = Category.find params[:category_id]
    @word = @category.words.build word_params
    if @word.save
      flash[:success] = "Word created"
      redirect_to admin_words_path
    else
      @categories = Category.all
      render "new"
    end
  end

  def edit
    @categories = Category.all
    @word = Word.find params[:id]
    @answers = @word.answers
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = "Word updated"
      redirect_to admin_words_path
    else
      @categories = Category.all
      render "edit"
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to categories_path}
      format.js
    end
  end

  private
  def word_params
    params.require(:word).permit :content, :category_id, 
      answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
