class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions
      t.string :cooking_time
      t.string :servings
      t.integer :user_id

      t.timestamps
    end
  end
end
