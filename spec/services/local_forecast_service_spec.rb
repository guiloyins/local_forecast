require "rails_helper"

RSpec.describe LocalForecastService, type: :service do
  let(:location) { "New York, NY" }
  let(:coordinates) { [40.7128, -74.0060] }
  let(:postal_code) { "10001" }
  let(:forecast_data) { {current: {temperature_2m: 75}, daily: {temperature_2m_max: 68, temperature_2m_min: 50}} }

  subject { described_class.new(location) }

  before do
    allow(Geocoder).to receive(:search).with(location).and_return(
      [
        double(
          coordinates:,
          postal_code:
        )
      ]
    )
    allow(WeatherApiService).to receive(:new).with(coordinates).and_return(double(call: forecast_data))
  end

  describe "#call" do
    context "when the forecast is not cached" do
      it "fetches the coordinates and postal code from the geocoder" do
        expect(Geocoder).to receive(:search).with(location)
        subject.call
      end

      it "fetches the forecast from the weather API" do
        Rails.cache.clear
        expect(WeatherApiService).to receive(:new).with(coordinates)
        subject.call
      end

      it "caches the forecast data" do
        expect(Rails.cache).to receive(:fetch).with("forecast-#{postal_code}", expires_in: 30.minutes).and_call_original
        subject.call
      end

      it "returns the forecast data" do
        result = subject.call
        expect(result).to eq(forecast_data)
      end
    end

    context "when the forecast is cached" do
      before do
        Rails.cache.write("forecast-#{postal_code}", forecast_data)
      end

      it "does not call the weather API" do
        expect(WeatherApiService).not_to receive(:new)
        subject.call
      end

      it "returns the cached forecast data" do
        result = subject.call
        expect(result).to eq(forecast_data)
      end
    end
  end
end
