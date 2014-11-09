class RecipeBuildForm
attr_reader :recipe

  def initialize(attributes)
    @attributes = attributes
  end

  def save
    # create
    @recipe = Recipe.create(name: @attributes[:name], directions: @attributes[:directions])

    @attributes[:ingredients].each do |id, value|
      if value.join != "" && value.length == 4
        Recipeingredient.create(ingredient_id: id, recipe_id: @recipe.id, unit: value[2], measurement: value[1], preparation: value[3] )
      end
    end
    add_ingredient
    @recipe.valid?
  end

  def add_ingredient
    @attributes[:ingredient].split(", ").each do |name|
      ingredient = Ingredient.create(name: name)
      Recipeingredient.create(ingredient_id: ingredient.id, recipe_id: @recipe.id)
    end
  end
end
