require "rails_helper"

RSpec.describe WeatherApiService, type: :service do
  describe "#call", :vcr do
    let(:location) { [40.7128, -74.0060] } # New York coordinates
    let(:service) { WeatherApiService.new(location) }

    it "returns a successful response" do
      response = service.call
      expect(response.code).to eq(200)
    end

    it "returns the correct weather data" do
      response = service.call
      data = JSON.parse(response.body)
      expect(data.dig("current", "temperature_2m")).to eq(71.7)
      expect(data.dig("current", "weather_code")).to eq(3)
    end
  end
end
