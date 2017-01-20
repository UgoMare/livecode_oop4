class View
  def display_all_recipes(recipes)
    puts '------------'
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. [#{recipe.rating}/5] #{recipe.name} - #{recipe.description}"
    end
    puts '------------'
  end

  def ask_for_name
    puts 'What is the name of your recipe?'
    print '> '
    return gets.chomp
  end

  def ask_for_description
    puts 'What is the description of your recipe?'
    print '> '
    return gets.chomp
  end

  def ask_for_rating
    puts 'What is the rating of your recipe?'
    print '> '
    return gets.chomp
  end

  def ask_for_index
    puts 'What is the index of the recipe you want to destroy'
    print '> '
    return gets.chomp.to_i - 1
  end

end







