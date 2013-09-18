class AddImageUrlToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :image_url, :string
    add_column :recipes, :serving, :int
    add_column :recipes, :preparation_time, :string
  end

  def self.down
    remove_column :recipes, :image_url
    remove_column :recipes, :serving
    remove_column :recipes, :preparation_time
  end
end
