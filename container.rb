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
    @parcels << parcel if available_volume?(parcel)
    update_volume
  end

  def remove_parcel(parcel)
    @parcels.delete(parcel)
    update_volume
  end

  # def report_volume
  #   @remaining_volume
  # end

  def update_volume
    @remaining_volume = @volume - @parcels.inject{|sum,x| sum + x }
  end

  def available_volume?(parcel)
    @remaining_volume > parcel.volume
  end

  def available_parcels
    @parcels
  end
end