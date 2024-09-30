# frozen_string_literal: true

require "rails_helper"

RSpec.describe LocalForecastsHelper, type: :helper do
  describe "#weather_code_to_weather" do
    it "returns 'Clear sky' for code 0" do
      expect(helper.weather_code_to_weather(0)).to eq("Clear sky")
    end

    it "returns 'Mainly clear' for code 1" do
      expect(helper.weather_code_to_weather(1)).to eq("Mainly clear")
    end

    it "returns 'Partly cloudy' for code 2" do
      expect(helper.weather_code_to_weather(2)).to eq("Partly cloudy")
    end

    it "returns 'Overcast' for code 3" do
      expect(helper.weather_code_to_weather(3)).to eq("Overcast")
    end

    it "returns 'Fog' for code 45" do
      expect(helper.weather_code_to_weather(45)).to eq("Fog")
    end

    it "returns 'Fog and depositing rime fog' for code 48" do
      expect(helper.weather_code_to_weather(48)).to eq("Fog and depositing rime fog")
    end

    it "returns 'Drizzle: Light intensity' for code 51" do
      expect(helper.weather_code_to_weather(51)).to eq("Drizzle: Light intensity")
    end

    it "returns 'Drizzle: Moderate intensity' for code 53" do
      expect(helper.weather_code_to_weather(53)).to eq("Drizzle: Moderate intensity")
    end

    it "returns 'Drizzle: Dense intensity' for code 55" do
      expect(helper.weather_code_to_weather(55)).to eq("Drizzle: Dense intensity")
    end

    it "returns 'Freezing Drizzle: Light intensity' for code 56" do
      expect(helper.weather_code_to_weather(56)).to eq("Freezing Drizzle: Light intensity")
    end

    it "returns 'Freezing Drizzle: Dense intensity' for code 57" do
      expect(helper.weather_code_to_weather(57)).to eq("Freezing Drizzle: Dense intensity")
    end

    it "returns 'Rain: Slight intensity' for code 61" do
      expect(helper.weather_code_to_weather(61)).to eq("Rain: Slight intensity")
    end

    it "returns 'Rain: Moderate intensity' for code 63" do
      expect(helper.weather_code_to_weather(63)).to eq("Rain: Moderate intensity")
    end

    it "returns 'Rain: Heavy intensity' for code 65" do
      expect(helper.weather_code_to_weather(65)).to eq("Rain: Heavy intensity")
    end

    it "returns 'Freezing Rain: Light intensity' for code 66" do
      expect(helper.weather_code_to_weather(66)).to eq("Freezing Rain: Light intensity")
    end

    it "returns 'Freezing Rain: Heavy intensity' for code 67" do
      expect(helper.weather_code_to_weather(67)).to eq("Freezing Rain: Heavy intensity")
    end

    it "returns 'Snow fall: Slight intensity' for code 71" do
      expect(helper.weather_code_to_weather(71)).to eq("Snow fall: Slight intensity")
    end

    it "returns 'Snow fall: Moderate intensity' for code 73" do
      expect(helper.weather_code_to_weather(73)).to eq("Snow fall: Moderate intensity")
    end

    it "returns 'Snow fall: Heavy intensity' for code 75" do
      expect(helper.weather_code_to_weather(75)).to eq("Snow fall: Heavy intensity")
    end

    it "returns 'Snow grains' for code 77" do
      expect(helper.weather_code_to_weather(77)).to eq("Snow grains")
    end

    it "returns 'Rain showers: Slight' for code 80" do
      expect(helper.weather_code_to_weather(80)).to eq("Rain showers: Slight")
    end

    it "returns 'Rain showers: Moderate' for code 81" do
      expect(helper.weather_code_to_weather(81)).to eq("Rain showers: Moderate")
    end

    it "returns 'Rain showers: Violent' for code 82" do
      expect(helper.weather_code_to_weather(82)).to eq("Rain showers: Violent")
    end

    it "returns 'Snow showers slight' for code 85" do
      expect(helper.weather_code_to_weather(85)).to eq("Snow showers slight")
    end

    it "returns 'Snow showers heavy' for code 86" do
      expect(helper.weather_code_to_weather(86)).to eq("Snow showers heavy")
    end

    it "returns 'Thunderstorm: Slight or moderate' for code 95" do
      expect(helper.weather_code_to_weather(95)).to eq("Thunderstorm: Slight or moderate")
    end

    it "returns 'Thunderstorm with slight hail' for code 96" do
      expect(helper.weather_code_to_weather(96)).to eq("Thunderstorm with slight hail")
    end

    it "returns 'Thunderstorm with heavy hail' for code 99" do
      expect(helper.weather_code_to_weather(99)).to eq("Thunderstorm with heavy hail")
    end

    it "returns nil for an unknown code" do
      expect(helper.weather_code_to_weather(999)).to be_nil
    end
  end
end
