class LessonsController < ApplicationController

  def new
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build user: current_user
    @words = @category.words.random_words current_user
    6.times {result = @lesson.results.build}
  end
end