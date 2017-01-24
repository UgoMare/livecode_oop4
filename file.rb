require 'pry-byebug'
class User

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    #self == the instance of the user on
    #which we call the instance method
    self.update(full_name: "#{@first_name} #{@last_name}")

  end

end

user = User.new('John', 'Doe')
puts user
# <User:0x23456543 @first_name='John',
#@last_name='Doe'>
user.update(full_name: "#{user.first_name} #{user.last_name}")
