class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "New category created !!!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    Category.find(params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to categories_path}
      format.js
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end
end
