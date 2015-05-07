class StaticPagesController < ApplicationController
  def home
    @activities = current_user.activity_followed.order_time
  end

  def help
  end
end