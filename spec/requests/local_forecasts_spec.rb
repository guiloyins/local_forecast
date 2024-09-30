# frozen_string_literal: true

require "rails_helper"

RSpec.describe "LocalForecasts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/local_forecasts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /search" do
    it "returns http success" do
      post "/local_forecasts/search", as: :turbo_stream, params: {location: "New York"}
      expect(response).to have_http_status(:success)
    end

    it "returns http unprocessable entity" do
      post "/local_forecasts/search", as: :turbo_stream, params: {location: ""}
      expect(flash[:alert]).to eq("Location cannot be blank")
    end

    it "returns http unprocessable entity" do
      post "/local_forecasts/search", as: :turbo_stream, params: {location: "qqqqqqqqqqqqqqqq"}
      expect(flash[:alert]).to eq("Location not found")
    end
  end
end
