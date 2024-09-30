# frozen_string_literal: true

module LocalForecastsHelper
  def weather_code_to_weather(code) # rubocop:disable Metrics/MethodLength
    weather_map = {
      0 => "Clear sky",
      1 => "Mainly clear",
      2 => "Partly cloudy",
      3 => "Overcast",
      45 => "Fog",
      48 => "Fog and depositing rime fog",
      51 => "Drizzle: Light intensity",
      53 => "Drizzle: Moderate intensity",
      55 => "Drizzle: Dense intensity",
      56 => "Freezing Drizzle: Light intensity",
      57 => "Freezing Drizzle: Dense intensity",
      61 => "Rain: Slight intensity",
      63 => "Rain: Moderate intensity",
      65 => "Rain: Heavy intensity",
      66 => "Freezing Rain: Light intensity",
      67 => "Freezing Rain: Heavy intensity",
      71 => "Snow fall: Slight intensity",
      73 => "Snow fall: Moderate intensity",
      75 => "Snow fall: Heavy intensity",
      77 => "Snow grains",
      80 => "Rain showers: Slight",
      81 => "Rain showers: Moderate",
      82 => "Rain showers: Violent",
      85 => "Snow showers slight",
      86 => "Snow showers heavy",
      95 => "Thunderstorm: Slight or moderate",
      96 => "Thunderstorm with slight hail",
      99 => "Thunderstorm with heavy hail"
    }
    weather_map[code]
  end
end
