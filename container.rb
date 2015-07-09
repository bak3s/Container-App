class Container
  attr_reader :volume,
              :remaining_volume,
              :parcels

  def initialize(volume)
    @volume = volume
    @remaining_volume = volume
    @parcels = []
  end

  def add_parcel(parcel)
    if !available_volume?(parcel)
      puts 'Sorry, not enough space for that parcel'
    end
    @parcels << parcel if available_volume?(parcel)
    update_volume
  end
  
  def select_id_of_parcel_to_remove
    if @parcels.empty?()
      puts 'Nothing to remove'
      return nil
    end
    puts 'Select index of parcel to remove'
    puts 'Enter 0 or a non-integer to remove nothing'
    @parcels.each_with_index do |parcel, index|
      puts "Parcel id #{parcel.id}  Index: #{index+1}"
    end
    selection = -1
    while selection < 0 || selection > @parcels.size
      selection = gets.chomp.to_i
      if selection < 0 || selection > @parcels.size
        puts 'Invalid Entry, try again'
      end
    end
    if selection == 0
      return nil
    end
    
    parcel = @parcels[selection-1]
    parcel.id
  end
  
  def find_parcel_from_id(id)
    @parcels.each  do |parcel|
      if parcel.id == id
        return parcel
      end
    end
  end

  def remove_parcel(parcel)
    @parcels.delete(parcel)
    update_volume
  end
  
  def update_volume
    @remaining_volume = @volume - @parcels.inject(0){|sum,parcel| sum + parcel.volume}
  end

  def available_volume?(parcel)
    @remaining_volume > parcel.volume
  end

  def id_taken?(id)
    @parcels.each do |parcel|
      if parcel.id == id
        return true
      end
    end
    false
  end
end