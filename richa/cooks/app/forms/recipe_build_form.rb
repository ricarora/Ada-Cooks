
UNIT = 2

class RecipeBuildForm
attr_reader :recipe

  def initialize(attributes, recipe = nil)
    @attributes = attributes
    @recipe = recipe
  end

  def save
    # create recipe
    @recipe = Recipe.create(name: @attributes[:name],
                            directions: @attributes[:directions],
                            cooking_time: @attributes[:cooking_time],
                            servings: @attributes[:servings])
    # These are the checkmarked already existing ingredients
    # add ingredient to the recipe
    @attributes[:ingredients].each do |id, value|
      if value.join != "" && value.length == 4
        # _, measurement, unit, preparation = value
        Recipeingredient.create(ingredient_id: id,
                                recipe_id: @recipe.id,
                                unit: value[UNIT],
                                measurement: value[1],
                                preparation: value[3])
      end
    end
    add_ingredient
    @recipe.valid?
  end

  # this is for the new ingredients at the bottom of the form
  def add_ingredient
    # add new ingredient & then add that to a recipe
    @attributes[:ingredient].each do |key, value|
      if value.join != ""
        ingredient = Ingredient.create(name: value[0])
        Recipeingredient.create(ingredient_id: ingredient.id,
                                recipe_id: @recipe.id,
                                unit: value[2],
                                measurement: value[1],
                                preparation: value[3])
      end
    end
  end

  def update

    @recipe.update(name: @attributes[:name],
                  directions: @attributes[:directions],
                  cooking_time: @attributes[:cooking_time],
                  servings: @attributes[:servings])

    # update ingredients to the recipe
    @attributes[:ingredients].each do |id, value|
      re_ing = @recipe.recipeingredients.find_by(ingredient_id: id)
      # ingredient was in recipe so we need to update
      if re_ing && value.length == 4
        re_ing.update(unit: value[2], measurement: value[1], preparation: value[3] )
      # length is 3, so it means that the ingredient was unchecked so we get rid of it
      elsif re_ing && value.length == 3
        re_ing.destroy
      # ingredient wasn't in recipe before so add it
      elsif value.join != "" && value.length == 4
        Recipeingredient.create(ingredient_id: id,
                                recipe_id: @recipe.id,
                                unit: value[2],
                                measurement: value[1],
                                preparation: value[3])
      end
    end
    add_ingredient
    @recipe.valid?
  end
end
