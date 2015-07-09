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
    puts 'Select id of parcel to remove from the following list'
    puts 'Press Enter key to remove nothing'
    @parcels.each {|parcel| puts parcel.id}
    gets.chomp
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