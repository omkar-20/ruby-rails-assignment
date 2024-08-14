class Ruby
  def initialize
    puts "Superclass"
  end

  def super_method
    puts 'super class method'
  end
end

class Inheritance < Ruby
  def initialize
    puts "sub class"
  end
  def super_method
    puts "sub class method"
  end
end

Ruby.new
sub_obj = Inheritance.new
sub_obj.super_method