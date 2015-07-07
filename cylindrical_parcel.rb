class CylindricalParcel < Parcel
  attr_accessor :radius

  def initialize(radius,height,id)
    @radius = radius
    @height = height
    @id = id
  end

  def volume
    Math.PI * (@radius**2) * @height
  end
end