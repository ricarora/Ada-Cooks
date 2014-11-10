class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe_form = RecipeBuildForm.new(params[:recipe_form])
    if @recipe_form.save
      redirect_to recipe_path(@recipe_form.recipe.id)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe_form = RecipeBuildForm.new(params[:recipe_form], @recipe)
    if @recipe_form.update
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    r = Recipe.find(params[:id])
    flash[:message] = "Deleted #{r.name}"
    r.destroy
    redirect_to recipes_path
  end
end
