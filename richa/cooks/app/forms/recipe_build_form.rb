class RecipeBuildForm
attr_reader :recipe

  def initialize(attributes)
    @attributes = attributes
  end

  def save
    # create
    @recipe = Recipe.create(name: @attributes[:name], directions: @attributes[:directions])

    @attributes[:ingredients].each do |id|
      Recipeingredient.create(ingredient_id: id, recipe_id: @recipe.id)
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
