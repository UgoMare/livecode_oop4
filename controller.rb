require_relative 'view'
require_relative 'recipe'
require_relative 'scrape'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  #1- List all the recipes
  def list
    #retrieve all the recipes from the cookbook
    recipes = @cookbook.all
    #pass the recipes to the view to desplay it
    @view.display_all_recipes(recipes)
  end

  #2- Add a recipe
  def add
    #ask the user what is the recipe
    name = @view.ask_for_name
    description = @view.ask_for_description
    rating = @view.ask_for_rating
    #get name, descr, rating gets.chomp
    #Create a new instance of `recipe`
    new_recipe = Recipe.new(name, description, rating)
    #Store the instance in the cookbook
    @cookbook.add(new_recipe)
  end
  #3- Destroy a recipe

  def destroy
    #Ask for the index
    index = @view.ask_for_index
    #give the index to the cookbook
    @cookbook.delete(index)
  end

  def import

    keyword = @view.ask_for_keyword
    new_scrape = Scrape.new(keyword)
    titles = new_scrape.get_titles
    @view.display_titles(titles)
    index = @view.ask_for_recipe_number
    recipe = titles[index][:title]
    scrape = new_scrape.get_recipe(index)
    description = scrape.get_description
    rating = scrape.get_rating
    new_recipe = Recipe.new(recipe, description, rating)
    @cookbook.add(new_recipe)
  end
end





