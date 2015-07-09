class CylindricalParcel < Parcel
  attr_accessor :radius

  def initialize(radius,height,id)
    @radius = radius
    @height = height
    @id = id
  end

  def volume
    Math::PI.round(3) * @radius * @radius * @height
  end
end