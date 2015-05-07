class LessonsController < ApplicationController
  before_action :logged_in_user

  def new
    @category = Category.find params[:category_id]
    @words = @category.words.random_words current_user
    if @words.count < 10
      flash[:danger] = "Not enough word to learn!"
      redirect_to :back
    else
      @lesson = @category.lessons.build user: current_user
      @words.each do |word|
        result = @lesson.results.build
        result.word = word
      end
    end
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      redirect_to category_lesson_path @category, @lesson, check: 1
    else
      flash[:danger] = "Submit error"
      redirect_to :back
    end 
  end

  def show
    @category = Category.find params[:category_id]
    @lesson = Lesson.find params[:id]
  end

  private
  def lesson_params
    params.require(:lesson).permit results_attributes: [:word_id, :answer_id]
  end
end