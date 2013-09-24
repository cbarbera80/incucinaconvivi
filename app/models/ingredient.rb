class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  def quantity_scaled(s)

    self.recipe.current_serving = s
    if self.allow_scale
      self.quantity.to_f * self.recipe.current_serving_scaled.to_f
    else
      self.quantity.to_f
    end

  end

end
