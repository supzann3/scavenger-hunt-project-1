module LocationHelper
  def concatenate_address(array)
    array.join(" ")
  end

  def geocoder_knows?(address)
    !!(Geocoder.search(address) == [])
  end

  def get_coordinates_from(address)
    [Geocoder.search(address)[0].latitude, Geocoder.search(address)[0].longitude]
  end
end
