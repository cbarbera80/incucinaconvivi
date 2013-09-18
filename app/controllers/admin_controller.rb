class AdminController < ApplicationController
  def index
    @total_recipes = Recipe.all.count
  end

end
