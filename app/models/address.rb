class Address

  def initialize(address)
    @address = address.join(" ")
  end

  def geocoder_knows?
    !(Geocoder.search(@address) == [])
  end

  def coordinates
    {latitude: Geocoder.search(@address)[0].latitude, longitude: Geocoder.search(@address)[0].longitude}
  end

end
