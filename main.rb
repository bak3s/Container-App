require './container'
require './parcel'
require './cuboidal_parcel'
require './cylindrical_parcel'
require 'securerandom'

def enter_positive_integer(prompt, error_message)
  puts prompt
  entry = 0
  while entry < 1
    entry = gets.chomp.to_i rescue entry = 0
    if entry < 1
      puts error_message
    end
  end
  entry
end

def enter_container_volume
  prompt = 'Enter container volume (must be a positive integer)'
  error_message = 'Invalid Volume Entry'
  enter_positive_integer(prompt, error_message)
end

def action_define
  puts 'Add a cuboidal parcel (1)'
  puts 'Add a cylindrical parcel (2)'
  puts 'Remove a parcel (3)'
  puts 'Quit (4)'
  selection = 0
  while (selection < 1) || (selection > 4)
    selection = gets.chomp.to_i rescue selection = 0
    if (selection < 1) || (selection > 4)
      puts 'Invalid Entry'
    end
  end
  selection
end

def enter_width
  prompt = 'Enter the Width'
  error_message = 'Invalid Entry'
  enter_positive_integer(prompt, error_message)
end

def enter_height
  prompt = 'Enter the Height'
  error_message = 'Invalid Entry'
  enter_positive_integer(prompt, error_message)
end

def enter_breadth
  prompt = 'Enter the Breadth'
  error_message = 'Invalid Entry'
  enter_positive_integer(prompt, error_message)
end

def enter_radius
  prompt = 'Enter Radius'
  error_message = 'Invalid Entry'
  enter_positive_integer(prompt, error_message)
end

def add_cuboidal_parcel(container)
  width = enter_width
  height = enter_height
  breath = enter_breadth
  id = enter_id(container)
  CuboidalParcel.new(width,breath,height, id)
end

def add_cylindrical_parcel(container)
  radius = enter_radius
  height = enter_height
  id = enter_id(container)
  CylindricalParcel.new(radius,height,id)
end

def enter_id(container)
  id = SecureRandom.hex
  puts "Generated Parcel ID #{id}"
end

container = Container.new(enter_container_volume)

chosen_action = action_define

while chosen_action < 4  do  
  if chosen_action == 1
    parcel = add_cuboidal_parcel(container)
    container.add_parcel(parcel)
  elsif chosen_action == 2
    parcel = add_cylindrical_parcel(container)
    container.add_parcel(parcel)
  elsif chosen_action == 3
    id = container.select_id_of_parcel_to_remove()
    container.remove_parcel(container.find_parcel_from_id(id))
  end
  puts "Remaining container volume is #{container.remaining_volume}"
  chosen_action = action_define
end

