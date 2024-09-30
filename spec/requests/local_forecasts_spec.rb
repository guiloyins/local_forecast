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
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns http unprocessable entity" do
      post "/local_forecasts/search", as: :turbo_stream, params: {location: "qqqqqqqqqqqqqqqq"}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
