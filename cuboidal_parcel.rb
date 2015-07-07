class CuboidalParcel < Parcel
  attr_reader :width,
              :breath

  def initialize(width,breath,height,id)
    @width = width
    @breath = breath
    @height = height
    @id = id
  end

  def volume
    @width * @height * @breath
  end
end