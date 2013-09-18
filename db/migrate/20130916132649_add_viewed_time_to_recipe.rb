class AddViewedTimeToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :viewed_time, :integer , :default => 0
  end

  def self.down
    remove_column :recipes, :viewed_time
  end
end
