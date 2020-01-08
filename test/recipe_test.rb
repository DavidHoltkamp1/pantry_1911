require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)

    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_initializes
    assert_equal "Mac and Cheese", @recipe.name
  end

  def test_it_starts_with_no_ingredients_but_can_add_ingredients
    assert_equal Hash.new, @recipe.ingredients_required

    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    expected = {
      @ingredient1 => 2,
      @ingredient2 => 8
    }

    assert_equal expected, @recipe.ingredients_required
  end

  def test_it_can_return_only_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal [@ingredient1, @ingredient2], @recipe.ingredients
  end

  def test_it_can_sum_total_calories_of_recipe
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 440, @recipe.total_calories
  end
end
