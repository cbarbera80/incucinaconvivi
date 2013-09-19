class AddAdviceToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :advice, :text
  end
end
