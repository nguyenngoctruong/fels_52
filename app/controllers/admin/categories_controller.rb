class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :require_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "New category created !!!"
      redirect_to categories_path
    else
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = "Category updated"
      redirect_to categories_path
    else
      render "edit"
    end
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
