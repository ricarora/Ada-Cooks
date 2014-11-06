class RecipeingredientsController < ApplicationController
  def index
    @recipeingredients = Recipeingredient.all
  end

  def new
    @recipeingredient = Recipeingredient.new
  end

  def create
    @recipeingredient = Recipeingredient.new
    if @recipeingredient.save
      redirect_to recipeingredients_path
    else
      render :new
    end
  end

  def show
    @recipeingredient = Recipeingredient.find(params[:id])
  end

  def edit
    @recipeingredient = Recipeingredient.find(params[:id])
  end

  def update
    @recipeingredient = Recipeingredient.find(params[:id])
    if @recipeingredient.update(params.require(:recipeingredient).permit(:recipe_id, :ingredient_id, :unit, :measurement, :preparation))
      redirect_to recipeingredient_path
    else
      render :edit
    end
  end

  def destroy
    Recipeingredient.find(params[:id]).destroy
  end
end
