# frozen_string_literal: true

class WeatherApiService
  include HTTParty
  base_uri "https://api.open-meteo.com/v1/forecast"

  def initialize(location)
    @options = {
      query: {
        latitude: location[0],
        longitude: location[1],
        current: %w[temperature_2m weather_code],
        daily: %w[temperature_2m_max temperature_2m_min],
        timezone: "auto",
        temperature_unit: "fahrenheit",
        forecast_days: 1
      }
    }
  end

  def call
    self.class.get("", @options)
  end
end
