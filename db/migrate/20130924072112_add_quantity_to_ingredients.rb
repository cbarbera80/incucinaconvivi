class AddQuantityToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :quantity, :decimal,  :precision => 8, :scale => 4
    add_column :ingredients, :allow_scale, :boolean, :default => true
  end
end
