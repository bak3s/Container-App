require './container'
require './parcel'
require './cuboidal_parcel'
require './cylindrical_parcel'

def container_define
  puts 'Enter container volume'
  gets.chomp.to_i
end

def action_define
  puts 'Add a cuboidal parcel (1)'
  puts 'Add a cylindrical parcel (2)'
  puts 'Remove a parcel (3)'
  puts 'Quit (4)'
  gets.chomp.to_i
end

def add_cuboidal_parcel
  puts 'Enter the Width'
  width = gets.chomp.to_i
  puts 'Enter the Height'
  height = gets.chomp.to_i
  puts 'Enter the Breath'
  breath = gets.chomp.to_i
  Cuboidal.new(width,breath,height)
end

container = Container.new(container_define)

chosen_action = action_define

while chosen_action < 4  do  
  if chosen_action == 1

  elsif chosen_action == 2

  elsif chosen_action == 3
    
  end
  chosen_action = action_define
end

