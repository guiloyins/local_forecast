require "rails_helper"

RSpec.describe WeatherApiService, type: :service do
  describe "#call" do
    let(:location) { [40.7128, -74.0060] } # New York coordinates
    let(:service) { WeatherApiService.new(location) }

    before do
      stub_request(:get, "https://api.open-meteo.com/v1/forecast/")
        .with(query: hash_including(latitude: location[0], longitude: location[1]))
        .to_return(status: 200,
          body: {
            temperature_2m: 75,
            weather_code: 1000
          }.to_json,
          headers: {"Content-Type" => "application/json"})
    end

    it "returns a successful response" do
      response = service.call
      expect(response.code).to eq(200)
    end

    it "returns the correct weather data" do
      response = service.call
      data = JSON.parse(response.body)
      expect(data["temperature_2m"]).to eq(75)
      expect(data["weather_code"]).to eq(1000)
    end
  end
end
