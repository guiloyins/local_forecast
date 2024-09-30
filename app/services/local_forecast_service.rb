class LocalForecastService
  def initialize(location)
    @location = location
  end

  def call
    raise ArgumentError, "Location cannot be blank" if @location.blank?

    # call the location API to get the coordinates and the postal code
    geocode_result = Geocoder.search(@location)
    return nil if geocode_result.blank?

    coordinates = geocode_result.first.coordinates
    postal_code = geocode_result.first.postal_code

    # call the weather API to get the forecast
    Rails.cache.fetch("forecast-#{postal_code}", expires_in: 30.minutes) do
      WeatherApiService.new(coordinates).call
    end
  end
end
