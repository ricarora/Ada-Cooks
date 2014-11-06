class CreateRecipeingredients < ActiveRecord::Migration
  def change
    create_table :recipeingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :unit
      t.integer :measurement
      t.string :preparation

      t.timestamps
    end
  end
end
