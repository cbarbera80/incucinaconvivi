class AddUmToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :um, :string
  end
end
