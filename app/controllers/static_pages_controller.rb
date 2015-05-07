class StaticPagesController < ApplicationController
  def home
    @activities = current_user.activity_followed
  end

  def help
  end
end