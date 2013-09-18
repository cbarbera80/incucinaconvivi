class AddCategoriesRecipesTable < ActiveRecord::Migration
  def self.up
    create_table :categories_recipes, :id => false do |t|
      t.integer :category_id
      t.integer :recipe_id
    end

    add_index :categories_recipes, [:category_id, :recipe_id]
  end

  def self.down
    drop_table :categories_recipes
  end
end
