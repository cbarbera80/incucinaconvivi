class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_variable
  before_filter :authorize

  def set_variable
    @categories = Category.all
    @hot_recipes = Recipe.find(:all, :order => 'viewed_time desc', :limit=>5)
  end

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end

end
