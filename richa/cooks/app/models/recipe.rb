class Recipe < ActiveRecord::Base
  has_many :recipeingredients
  has_many :ingredients, through: :recipeingredients
end
