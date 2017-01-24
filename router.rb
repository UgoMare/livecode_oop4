class Router

  def initialize(controller)
    @controller = controller
  end


  def run
    loop do #infinite loop
      print_menu
      action = gets.chomp.to_i
      case action
      when 1
        @controller.list
      when 2
        @controller.add
      when 3
        @controller.destroy
      when 4
        @controller.import
      else
        puts 'You dummy'
      end
    end
  end

  private
  def print_menu
    puts 'What do you want to do?'
    puts '1- List all the recipes'
    puts '2- Add a recipe'
    puts '3- Remove a recipe'
    puts '4- Import'
  end
end
