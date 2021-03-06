class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'ingredients_name_1')
    @recipe.ingredients.build(name: 'ingredients_name_2')
    # @recipe.ingredients.build(quantity: 'ingredient_quantity')
  end

  def create
    @recipe = Recipe.find_by(params[:id])
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attribute: [
        :name,
        :quantity,
        :recipe_id
      ]
    )
  end
end
