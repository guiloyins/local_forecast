# frozen_string_literal: true

class LocalForecastsController < ApplicationController
  rescue_from ArgumentError, with: :invalid_location
  def index
  end

  def search
    @location = params[:location]
    @forecast = LocalForecastService.new(@location).call&.deep_symbolize_keys
    if @forecast
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(
              "search_forecast",
              partial: "search_field",
              locals: {forecast: @forecast}
            ),
            turbo_stream.replace("forecast_result", partial: "forecast_data", locals: {forecast: @forecast})
          ]
        end
      end
    else
      render :index, alert: "Location not found", status: :unprocessable_entity
    end
  end

  def invalid_location
    render :index, alert: "Location cannot be blank", status: :unprocessable_entity
  end
end
