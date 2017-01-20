require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  def delete(index)
    @recipes.delete_at(index)
    save_csv
  end

  def all
    return @recipes
  end

  private
  def load_csv
    CSV.foreach(@csv_file) do |row|
      recipe = Recipe.new(row[0], row[1], row[2])
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating]
      end
    end
  end
end





