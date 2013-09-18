class AddDirectionsToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :directs, :text
  end

  def self.down
    remove_column :recipes, :directs
  end
end
