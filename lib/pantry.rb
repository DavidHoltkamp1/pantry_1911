class Pantry
attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    return 0 if !@stock.include?(ingredient)
    @stock.map do |ingredient, amount|
      amount
    end.first
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe_ingredient_amount = recipe.ingredients_required.reduce({}) do |acc, ingredient|
      acc[ingredient.first.name] = ingredient.last
      acc
    end
    recipe_ingredient_amount.map do |ingredient, amount|
     if stock_check(ingredient) < amount
      return false
     else
      return true
     end
   end
  end
end
