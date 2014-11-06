class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params.require(:ingredient).permit(:name))
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(params.require(:ingredient).permit(:name))
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
  end
end
